const std = @import("std");
const znvim = @import("znvim");

const tcpConnectToAddress = std.net.tcpConnectToAddress;
const TcpConnectToAddressError = std.net.TcpConnectToAddressError;

const Self = @This();

pub fn init(address: std.net.Address) !void {
    const alloc = std.heap.page_allocator;

    const fmt_address = try std.fmt.allocPrint(alloc, "{}", .{address});
    const argv = [_][]const u8{
        "nvim",
        "--embed",
        "--headless",
        "--listen",
        fmt_address,
    };
    var process = std.ChildProcess.init(&argv, alloc);

    defer _ = process.kill() catch {
        std.debug.print("Can't kill process", .{});
    };

    process.stdin_behavior = .Pipe;
    process.stdout_behavior = .Pipe;

    try process.spawn();

    const nvim_stdin = if (process.stdin) |val| val else @panic("not get nvim stdin!");
    const nvim_stdout = if (process.stdout) |val| val else @panic("not get nvim stdout!");

    const nvim = znvim.DefaultClient(.file);

    const arr = try znvim.Payload.arrPayload(0, alloc);
    defer arr.free(alloc);

    var client = try nvim.init(nvim_stdin, nvim_stdout, alloc);
    const call = try client.call("nvim_win_get_cursor", arr);
    // call.result

    std.debug.print("{any}", .{call.err.arr[1]});
}
