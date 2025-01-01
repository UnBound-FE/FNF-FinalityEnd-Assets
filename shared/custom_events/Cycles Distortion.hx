import objects.BGSprite;
import psychlua.LuaUtils.getTweenEaseByString;
using StringTools;

// The shader.
var shader:FlxRuntimeShader = null;

// If shaders are enabled, initialize the shader.
if (ClientPrefs.data.shaders) {

  game.initLuaShader('cyclesd');

  shader = game.createRuntimeShader('cyclesd');
  shader.setFloat('amount', .0);
  shader.setFloat('pixel', .0);

  game.camGame.filters = [new ShaderFilter(shader)];

}

// New camera for the static. Adds the static to the camera.
// The new camera should get cleared when the state is destroyed.
//
// This usually shouldn't cause too much harm for other scripts, but worst-case,
// you should always double check the cameras you're grabbing and match them with what
// you need. Like, if you're looking through the camera list.
//
// If anything, remove this code and set screenStatic's camera as game.camHUD, and insert
// it before whatever was added first on that camera. blah blah blah
final camStatic:FlxCamera = new FlxCamera();
camStatic.bgColor = 0x0;
FlxG.game.addChildAt(camStatic.flashSprite, FlxG.game.getChildIndex(game.camHUD.flashSprite));
FlxG.cameras.list.insert(FlxG.cameras.list.indexOf(game.camHUD) - 1, camStatic);

// Static.
final screenStatic:BGSprite = new BGSprite('static', 0, 0, 0, 0, ['Static'], true);
screenStatic.alpha = .0001;
screenStatic.cameras = [camStatic];
screenStatic.setGraphicSize(FlxG.width, FlxG.height); // Because of the shader, it'll show ~1 pixel of camGame on the right in windowed (not fullscreen). :p
screenStatic.updateHitbox();
screenStatic.antialiasing = false;
add(screenStatic);

// The tweens get put here so they don't overlap after I cancel them.
// 0 = amount, 1 = pixel, 2 = static
final tweenHandlers:Array<FlxTween> = [];

// OMG THE EVENT!!!
function onEvent(eventName:String, value1:String, value2:String, ?strumTime:Float):Void {

  // If the event is indeed the event.
  // MAY OVERLAP OTHER EVENTS WITH THE EXACT NAME!!!
  if (eventName.toLowerCase().trim().replace('-', '').replace('_', '').replace(' ', '') == 'cyclesdistortion') {

    // Split value1.
    final newValue1:Array<String> = value1.toLowerCase().trim().replace('-', '').replace(' ', '').split(',');
    if (newValue1[0] == '') {
      // If the first value for value1 is empty, default to static.
      newValue1[0] = 'static';
    }
    // .split is weird...
    // If the second value for value1 is "empty", default to linear.
    newValue1[1] ??= 'linear';

    // Split value2.
    final newValue2:Array<String> = value2.trim().replace(' ', '').split(',');
    if (newValue2[0] == '') {
      // If the first value for value2 is empty, default the value you're tweeing to 1.
      newValue2[0] = '1.0';
    }
    // .split is weird...
    // If the second value for value2 is "empty", default to a duration of 1.
    newValue2[1] ??= '1.0';

    var tween:FlxTween = null; // Set to the current tween.
    final toTween:String = newValue1[0]; // Thing you're tweening.
    var newValue:Float = Std.parseFloat(newValue2[0]); // New value of 'toTween'.
    final durationOfTween:Float = Std.parseFloat(newValue2[1]) / game.playbackRate; // Duration of the tween, synced with playback.
    final easeOfTween:String = newValue1[1]; // How the tween should tween.

    // If you're tweening a shader variable.
    if ((toTween == 'amount' || toTween == 'pixel')) {

      // Handle the tween if shaders are enabled.
      if (ClientPrefs.data.shaders && shader != null) {

        // Grab either the first element (amount), or the second by default (pixel).
        tween = tweenHandlers[toTween == 'amount' ? 0 : 1];

        // If this isn't the first tween and it's not finished yet, cancel it.
        if (tween != null && !tween.finished) {
          tween.cancel();
        }

        // Set the new tween.
        // The shader's value you're setting will update accordingly.
        tween = FlxTween.num(shader.getFloat(toTween), newValue, durationOfTween, {ease: getTweenEaseByString(easeOfTween)}, (value:Float) -> {
          shader.setFloat(toTween, value);
        });

      }

      // Return to not mess with static.
      return;

    }

    // Grab the pixel tween.
    tween = tweenHandlers[2];

    // If this isn't the first tween and it's not finished yet, cancel it.
    if (tween != null && !tween.finished) {
      tween.cancel();
    }

    // Restart the animation.
    // Set the alpha to whatever newValue (bounded to 0 through 1) is.
    // Set the new tween.
    screenStatic.animation.curAnim.curFrame = 0;
    screenStatic.alpha = newValue = Math.max(0, Math.min(newValue, 1));
    tweenHandlers[2] = FlxTween.tween(screenStatic, {alpha: .0001}, durationOfTween, {ease: getTweenEaseByString(easeOfTween)});

  }

  return;

}