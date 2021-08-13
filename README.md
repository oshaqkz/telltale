telltale
---

<img src="telltale/telltale.png" alt="drawing" width="250"/>

A simple service capable of broadcasting/sending events/messages.

Getting started
---


* `WebSockets :: ws://` `/api/inboxes/current`

> Subscribe to incoming direct messages. Note that this endpoint extracts the current **authenticated user** from a custom **USERNAME** header added by `api-gateway`.

* `WebSockets :: ws://` `/api/channels/<channel-name>`

> Send (or subscribe to) a message for a group of receivers (or publishers). Please note that this endpoint requires the following json structure: `{"message": "your message"}`, current **authenticated user** is extracted from a custom **USERNAME** header added by `api-gateway`.
