#import "SnapshotHelper.js"

var target = UIATarget.localTarget();
var app = target.frontMostApp();
var window = app.mainWindow();


target.delay(5)
captureLocalizedScreenshot("01-ShotView")

window.tableViews()[0].cells()[0].tap();
target.delay(1);
captureLocalizedScreenshot("02-DetailsView")

app.navigationBar().rightButton().tap();
target.delay(1)
captureLocalizedScreenshot("03-Sharing")