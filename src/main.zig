const std = @import("std");
const Nvim = @import("./nvim.zig");
// const UI = @import("./ui.zig");

pub fn main() !void {
    _ = try Nvim.init("localhost", 4444);
    // UI.ui();
}
