# Internet Speed Monitor
Simple Docker based app to monitor a machine's internet speeds.

## Why

I despise my home internet.

## What Do

1. Clone
2. docker-compose up -d
3. Point your browser at http://localhost:8080
4. Grafana login is admin:admin
5. Click the gear icon in the lower left
6. We need to add a data source for our elastic search instance. Click the Add new Data source button.
7. In the "Logging & document databases" section, click Elasticsearch
8. Settings should be:

URL: http://elastic:9200
Index name: speedtests
Time field name: timestamp

9. Click "Save & test". This will result in an error about not being able to find the specified index. This will resolve itself after the first run of the cron script that is started when the scripts container comes up.
10. Once saved, hover over the four box icon on the left and click "New Dashboard" and then click "Add a new panel"
11. Make sure the Data Source selected is Elasticsearch. Change the following:

Metric should be "Extended Stats", select "download" to the right of it. Change "Stats" to Avg.
In the right paneL

Title: whatever makes sense
Connect null values: Always
Show points: Always

Standard options section:

Unit: bits(IEC)

12. Click Apply, you'll be taken to your new dashboard. You can duplicate the panel you just made and add different stats as you want. I have "Downloads", "Uploads", "Ping".

## What Not Do

Removing volumes will delete any setup in Grafana you've done. Will also clear elasticsearch of any previous timeseries data.

## Future

Will look into:

1. Preserving data through volume removal
2. Dashboard and Data source configuration done and ready out of the box
