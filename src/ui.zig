const webview = @import("webview").WebView;

const JS =
    \\var h1 = document.createElement("h1")
    \\h1.innerHTML = "Hello webview from Zig!"
    \\document.body.appendChild(h1)
;

pub fn ui() void {
    const w = webview.create(false, null);
    defer w.destroy();
    w.setTitle("Calling Javascript");
    w.setSize(480, 320, webview.WindowSizeHint.None);
    w.eval(JS);
    w.run();
}
