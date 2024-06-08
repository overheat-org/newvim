import React from 'react';
import { createRoot } from 'react-dom/client';
import App from './App';

document.body.appendChild((() => {
    const element = document.createElement("div");
    element.id = 'root';
    return element;
})());
const container = document.getElementById('root')!;
const root = createRoot(container);
root.render(<App />);