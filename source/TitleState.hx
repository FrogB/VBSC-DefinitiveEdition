package;

import openfl.ui.Mouse;
import openfl.Lib;
import flixel.system.debug.Window;
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
import flixel.FlxG;
import flash.ui.MouseCursor;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
//import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.math.FlxMath;
import lime.app.Application;
import openfl.Assets;
import flash.Lib;

using StringTools;

class TitleState extends MusicBeatState
{
	public static var muteKeys:Array<FlxKey> = [FlxKey.ZERO];
	public static var volumeDownKeys:Array<FlxKey> = [FlxKey.NUMPADMINUS, FlxKey.MINUS];
	public static var volumeUpKeys:Array<FlxKey> = [FlxKey.NUMPADPLUS, FlxKey.PLUS];

	static var initialized:Bool = false;

	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var logoSpr:FlxSprite;

	var curWacky:Array<String> = [];

	var wackyImage:FlxSprite;

	var easterEggEnabled:Bool = true; //Disable this to hide the easter egg
	var easterEggKeyCombination:Array<FlxKey> = [FlxKey.B, FlxKey.B]; //bb stands for bbpanzu cuz he wanted this lmao
	var lastKeysPressed:Array<FlxKey> = [];

	var debugShit:String = "";

	var urlSpotter:Bool = false;

	override public function create():Void
	{
		#if html5
		urlSpotter = true;
		#end
		if(urlSpotter)
			{
				trace("IMAGINE LMAO");
				lime.app.Application.current.window.alert("Hey. Please play the windows version instead of the website version for a better experience.", 'Website Version Detected');
			}
		#if windows
		trace("your current path is: " + CoolSystemStuff.getTempPath());
		#end
		ClientPrefs.framerate = 144;
		#if windows
		#end
		#if (polymod && !html5)
		if (sys.FileSystem.exists('mods/')) {
			var folders:Array<String> = [];
			for (file in sys.FileSystem.readDirectory('mods/')) {
				var path = haxe.io.Path.join(['mods/', file]);
				if (sys.FileSystem.isDirectory(path)) {
					folders.push(file);
				}
			}
			if(folders.length > 0) {
				polymod.Polymod.init({modRoot: "mods", dirs: folders});
			}
		}

		//Gonna finish this later, probably
		#end
		FlxG.game.focusLostFramerate = 144; // oh god damn it cant it run faster jool?
		FlxG.sound.muteKeys = muteKeys;
		FlxG.sound.volumeDownKeys = volumeDownKeys;
		FlxG.sound.volumeUpKeys = volumeUpKeys;

		PlayerSettings.init();

		curWacky = FlxG.random.getObject(getIntroTextShit());

		// DEBUG BULLSHIT

		swagShader = new ColorSwap();
		super.create();

		FlxG.save.bind('funkin', 'ninjamuffin99');
		ClientPrefs.loadPrefs();

		Highscore.load();

		if (FlxG.save.data.weekCompleted != null)
		{
			StoryMenuState.weekCompleted = FlxG.save.data.weekCompleted;
		}

		#if FREEPLAY
		MusicBeatState.switchState(new FreeplayState());
		#elseif CHARTING
		MusicBeatState.switchState(new ChartingState());
		#else
		if(FlxG.save.data.flashing == null && !FlashingState.leftState) {
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			MusicBeatState.switchState(new FlashingState());
		} else {
			#if desktop
			DiscordClient.initialize();
			Application.current.onExit.add (function (exitCode) {
				DiscordClient.shutdown();
			});
			#end
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				startIntro();
			});
		}
		#end
		if(!initialized) {
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('bambi/something'));
		bg.screenCenter();
		add(bg);
		}
	}

	var logoBl:FlxSprite;
	var slidething:FlxBackdrop;
	var gfDance:FlxSprite;
	var danceLeft:Bool = false;
	var titleText:FlxSprite;
	var swagShader:ColorSwap = null;

	function startIntro()
	{
		if(initialized) {
			var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('bambi/something'));
			bg.screenCenter();
			add(bg);
		}
		if (!initialized)
		{
			/*var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;

			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
				new FlxRect(-300, -300, FlxG.width * 1.8, FlxG.height * 1.8));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1),
				{asset: diamond, width: 32, height: 32}, new FlxRect(-300, -300, FlxG.width * 1.8, FlxG.height * 1.8));
				
			transIn = FlxTransitionableState.defaultTransIn;
			transOut = FlxTransitionableState.defaultTransOut;*/

			// HAD TO MODIFY SOME BACKEND SHIT
			// IF THIS PR IS HERE IF ITS ACCEPTED UR GOOD TO GO
			// https://github.com/HaxeFlixel/flixel-addons/pull/348

			// var music:FlxSound = new FlxSound();
			// music.loadStream(Paths.music('freakyMenu'));
			// FlxG.sound.list.add(music);
			// music.play();

			if(FlxG.sound.music == null) {
				FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

				FlxG.sound.music.fadeIn(4, 0, 0.7);
			}
		}

		Conductor.changeBPM(125);
		persistentUpdate = true;

		slidething = new FlxBackdrop(Paths.image('slider'),1,0,true,false);
		slidething.velocity.set(-14,0);
		slidething.x = -20;
		slidething.y = 209;
		slidething.setGraphicSize(Std.int(slidething.width * 0.65));
		slidething.alpha = 0.3;
		add(slidething);

		logoBl = new FlxSprite(-1100, -25);
		logoBl.frames = Paths.getSparrowAtlas('s_logoBumpin');
		logoBl.antialiasing = ClientPrefs.globalAntialiasing;
		logoBl.animation.addByPrefix('logoBumpin', 'logoBumpin', 24);
		logoBl.animation.play('logoBumpin');
		logoBl.setGraphicSize(Std.int(logoBl.width * 0.9));
		logoBl.updateHitbox();
		// logoBl.screenCenter();
		// logoBl.color = FlxColor.BLACK;

		swagShader = new ColorSwap();
		if(!FlxG.save.data.psykaEasterEgg || !easterEggEnabled) {
			gfDance = new FlxSprite(FlxG.width * 0.35, FlxG.height * 0.7);
			gfDance.frames = Paths.getSparrowAtlas('gfDanceTitle');
			gfDance.animation.addByPrefix('GF Dancing Beat', 'GF Dancing Beat', 24, false);
		}
		else //Psyka easter egg
		{
			gfDance = new FlxSprite(FlxG.width * 0.35, FlxG.height * 1.2);
			gfDance.frames = Paths.getSparrowAtlas('psykaDanceTitle');
			gfDance.animation.addByIndices('danceLeft', 'psykaDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
			gfDance.animation.addByIndices('danceRight', 'psykaDance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		}
		gfDance.antialiasing = ClientPrefs.globalAntialiasing;
		add(gfDance);
		gfDance.x += -200;
		gfDance.shader = swagShader.shader;
		add(logoBl);
		FlxTween.angle(logoBl, -5, 5, Conductor.crochet / 300, {ease: FlxEase.sineInOut, type: PINGPONG});
		
		//logoBl.shader = swagShader.shader;

		titleText = new FlxSprite(100, FlxG.height * 0.8);
		titleText.frames = Paths.getSparrowAtlas('titleEnter');
		titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
		titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
		titleText.antialiasing = ClientPrefs.globalAntialiasing;
		titleText.animation.play('idle');
		titleText.updateHitbox();
		// titleText.screenCenter(X);
		add(titleText);

		var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('logo'));
		logo.screenCenter();
		logo.antialiasing = ClientPrefs.globalAntialiasing;
		// add(logo);

		// FlxTween.tween(logoBl, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG});
		// FlxTween.tween(logo, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		blackScreen = new FlxSprite().loadGraphic(Paths.image('bambi/something'));
		blackScreen.screenCenter();
		credGroup.add(blackScreen);

		credTextShit = new Alphabet(0, 0, "", true);
		credTextShit.screenCenter();

		// credTextShit.alignment = CENTER;

		credTextShit.visible = false;

		logoSpr = new FlxSprite(0, FlxG.height * 0.4).loadGraphic(Paths.image('titlelogo'));
		add(logoSpr);
		logoSpr.visible = false;
		logoSpr.setGraphicSize(Std.int(logoSpr.width * 0.45));
		logoSpr.updateHitbox();
		logoSpr.screenCenter(X);
		logoSpr.antialiasing = ClientPrefs.globalAntialiasing;

		FlxTween.tween(credTextShit, {y: credTextShit.y + 20}, 2.9, {ease: FlxEase.quadInOut, type: PINGPONG});

		if (initialized)
			skipIntro();
		else
			initialized = true;

		// credGroup.add(credTextShit);
	}

	function getIntroTextShit():Array<Array<String>>
	{
		var fullText:String = Assets.getText(Paths.txt('introText'));

		var firstArray:Array<String> = fullText.split('\n');
		var swagGoodArray:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagGoodArray.push(i.split('--'));
		}

		return swagGoodArray;
	}

	var transitioning:Bool = false;

	override function update(elapsed:Float)
	{
		FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, CoolUtil.boundTo(1 - (elapsed * 3.125), 0, 1)); // funny camera
		
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		// FlxG.watch.addQuick('amp', FlxG.sound.music.amplitude);

		if (FlxG.keys.justPressed.F)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}

		var pressedEnter:Bool = FlxG.keys.justPressed.ENTER;

		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				pressedEnter = true;
			}
		}
		#end

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad != null)
		{
			if (gamepad.justPressed.START)
				pressedEnter = true;

			#if switch
			if (gamepad.justPressed.B)
				pressedEnter = true;
			#end
		}

		// EASTER EGG

		if (!transitioning && skippedIntro)
		{
			if(pressedEnter)
			{
				if(titleText != null) titleText.animation.play('press');

				if(ClientPrefs.flashing) { FlxG.camera.flash(FlxColor.WHITE, 1, null, true); } // yay it affects the flashing option thingy now ig
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

				transitioning = true;
				// FlxG.sound.music.stop();

				new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					MusicBeatState.switchState(new WarningState());
					closedState = true;
				});
				// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
			}
			else if(easterEggEnabled)
			{
				var finalKey:FlxKey = FlxG.keys.firstJustPressed();
				if(finalKey != FlxKey.NONE) {
					lastKeysPressed.push(finalKey); //Convert int to FlxKey
					if(lastKeysPressed.length > easterEggKeyCombination.length)
					{
						lastKeysPressed.shift();
					}
					
					if(lastKeysPressed.length == easterEggKeyCombination.length)
					{
						var isDifferent:Bool = false;
						for (i in 0...lastKeysPressed.length) {
							if(lastKeysPressed[i] != easterEggKeyCombination[i]) {
								isDifferent = true;
								break;
							}
						}

						if(!isDifferent) {
							trace('Easter egg triggered!');
							FlxG.save.data.psykaEasterEgg = !FlxG.save.data.psykaEasterEgg;
							FlxG.sound.play(Paths.sound('secretSound'));

							var black:FlxSprite = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
							black.alpha = 0;
							add(black);

							FlxTween.tween(black, {alpha: 1}, 1, {onComplete:
								function(twn:FlxTween) {
									FlxTransitionableState.skipNextTransIn = true;
									FlxTransitionableState.skipNextTransOut = true;
									MusicBeatState.switchState(new TitleState());
								}
							});
							lastKeysPressed = [];
							closedState = true;
							transitioning = true;
						}
					}
				}
			}
		}

		if (pressedEnter && !skippedIntro)
		{
			skipIntro();
		}

		if(swagShader != null)
		{
			if(controls.UI_LEFT) swagShader.hue -= elapsed * 0.1;
			if(controls.UI_RIGHT) swagShader.hue += elapsed * 0.1;
		}

		super.update(elapsed);
	}

	function createCoolText(textArray:Array<String>, ?offset:Float = 0)
	{
		for (i in 0...textArray.length)
		{
			var money:FlxText = new FlxText(0, 0, FlxG.width, textArray[i], 48);
				money.setFormat("Comic Sans MS Bold", 48, FlxColor.WHITE, CENTER);
				money.screenCenter(X);
				money.y += (i * 60) + 200 + offset;
				credGroup.add(money);
				textGroup.add(money);
		}
	}

	function addMoreText(text:String, ?offset:Float = 0)
	{
		if(textGroup != null) {
			var coolText:FlxText = new FlxText(0, 0, FlxG.width, text, 48);
			coolText.setFormat("Comic Sans MS Bold", 48, FlxColor.WHITE, CENTER);
			coolText.screenCenter(X);
			coolText.y += (textGroup.length * 60) + 200 + offset;
			credGroup.add(coolText);
			textGroup.add(coolText);
		}
	}

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	private static var closedState:Bool = false;
	override function beatHit()
	{
		super.beatHit();

		if(logoBl != null) 
			logoBl.animation.play('bump');

		gfDance.animation.play('GF Dancing Beat');
		
		if (FlxG.camera.zoom < 1.35 && ClientPrefs.camZooms && curBeat % 2 == 0) // the funni camera zoom each beat
			FlxG.camera.zoom += 0.015;

		if(!closedState) {
			switch (curBeat)
			{
				case 1:
					createCoolText(['Friday Night Funkin By ninjamuffin99, kawaisprite, PhantomArcade and evilsk8r'], 45);
				case 2:
					deleteCoolText();
				case 3:
					createCoolText(['Psych Engine By\nShadow Mario\nRiverOaken\nbb-panzu']);
				case 4:
					deleteCoolText();
				case 5:
					createCoolText(['A fan tweak \nof this game down below:'], -60);
					logoSpr.visible = true;
				case 6:
					deleteCoolText();
					logoSpr.visible = false;
				case 7:
					createCoolText(['VS Dave and Bambi by\nMoldyGH, MissingTextureMan101,\nrapparep lol, TheBuilderXD,\nT5mpler, Erizur, Billy Bobbo\nCuszie, Marcello_TIMEnice30'], -60);
				case 8:
					deleteCoolText();
				case 9:
					createCoolText(["Vs Bambi: Strident Crisis by\njoolian, DeltaTheJ, LiterallyWize,\nOOF PRODUCTIONS, PizzaSliceJm, iplux,\nAlex Director, Memory_001, RoundCatArchives,\n...and the rest of the Strident Crisis Dev Team!"]);
				case 10:
					deleteCoolText();
				case 11:
					createCoolText(["Strident Engine By"]);
					addMoreText('DeltaTheJ and Joalor64GH');
				case 12:
					deleteCoolText();
				case 13:
					createCoolText(["Strident Crisis - FrogB's Cut by"]);
					addMoreText('FrogB, FyridSF, Rambi, RandoScript and Pip');
				case 14:
					deleteCoolText();
				case 15:
					createCoolText([curWacky[0]]);
					addMoreText(curWacky[1]);
				case 16:
					deleteCoolText();
				case 17:
					addMoreText("Friday Night Funkin'");
				case 18:
					addMoreText('Vs Bambi: Strident Crisis');
				case 19:
					addMoreText("FrogB's Cut");
				case 20:
					skipIntro();
			}
		}
	}

	var skippedIntro:Bool = false;

	function skipIntro():Void
	{
		if (!skippedIntro)
		{
			Conductor.changeBPM(90);
			remove(logoSpr);

			FlxG.camera.flash(FlxColor.WHITE, 4);
			//DOUBLE TWEEN BOIII WHAT DA HAILLLLLLL
			FlxTween.tween(logoBl,{x: 15}, 1.4, {ease: FlxEase.expoInOut});
			FlxTween.tween(gfDance, {y: -15}, 1.4, {ease: FlxEase.expoInOut});
			remove(credGroup);
			skippedIntro = true;
		}
	}
}