count_widget
============

A time counting widget for Dashing. 

It receives unix timestamp and shows time difference with current time.

If the timestamp is older than current time, it will show the difference like "1 day 12:34:56 ago". If the timestamp is newer, it will show it like "In 1 day 12:34:56".

Additionally, a second and third line can be added.

Use it like that:

```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="mywidget" data-view="Count" data-title="Time" style="background-color:#3182bd"></div>
</li>
```
Update it like this:

```sh
$ curl -d '{ "auth_token": "YOUR_AUTH_TOKEN" , "ux_time": 1400000000, "additional-desc": "On expiration:", "additional-text": "call bomb squad"}' http://dashing.local/widgets/mywidget
```



