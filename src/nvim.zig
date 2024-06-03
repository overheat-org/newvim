const std = @import("std");
const network = @import("network");
const Self = @This();

pub fn init(address: []const u8, port: u16) !void {
    const alloc = std.heap.page_allocator;

    const fmt_address = try std.fmt.allocPrint(alloc, "{s}:{}", .{ address, port });
    const argv = [_][]const u8{ "nvim", "--headless", "--listen", fmt_address };

    var process = std.ChildProcess.init(&argv, alloc);
    alloc.free(fmt_address);
    // defer _ = process.kill() catch {
    //     std.debug.print("Can't kill process", .{});
    // };

    std.debug.print("RUNNING", .{});
    _ = try process.spawn();
    std.time.sleep(1000000000 * 5);

    std.debug.print("INITIALIZING", .{});

    try network.init();
    defer network.deinit();

    const sock = try network.connectToHost(alloc, address, port, .tcp);
    defer sock.close();

    const writer = sock.writer();
    const reader = sock.reader();

    const msg = "hello world";

    const json_rpc = try std.fmt.allocPrint(alloc, msg, .{});
    defer alloc.free(json_rpc);

    try writer.writeAll(json_rpc);

    var buf: [128]u8 = undefined;
    std.debug.print("Echo: {any}", .{buf[0..try reader.readAll(buf[0..msg.len])]});
}
