const webview = @import("webview").raw;
const std = @import("std");

const JS =
    \\var h1 = document.createElement("h1")
    \\h1.innerHTML = "Hello webview from Zig!"
    \\document.body.appendChild(h1)
;

pub fn ui() void {
    // const w = webview.create(false, null);
    // std.debug.print("raw: {any}", .{webview.webview_version()});
    // defer w.destroy();
    // w.setTitle("Calling Javascript");
    // w.setSize(1024, 720, .None);
    // // w.eval(JS);
    // w.run();
}
