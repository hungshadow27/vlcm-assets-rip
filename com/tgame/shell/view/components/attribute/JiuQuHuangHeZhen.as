package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.jiuquhuanghezhen.model.info.JiuQuHuangHeZhenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class JiuQuHuangHeZhen extends Sprite
   {
      
      public static const UI_JIUQUHUANGHEZHEN_GUANBI_CLICK:String = "UI_JIUQUHUANGHEZHEN_GUANBI_CLICK";
      
      public var $parent:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var tf:TextFormat;
      
      private var ftaName:FTextArea;
      
      private var lingWuBtn:SmallButton;
      
      private var ft:FTextArea;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      public var tupoBo:Boolean = false;
      
      private var gongImg:DisplayObject;
      
      private var gongImgObj:Object = {};
      
      private var tarenBo:Boolean = true;
      
      private var jiuquhuangheTupo:JiuQuHuangHeZhenTupoCanvas;
      
      private var dqId:int;
      
      private var bg:DisplayObject;
      
      private var bgSpr:Sprite;
      
      private var lingBo:Boolean = false;
      
      private const MAX_ZHAOSHI_COUNT:int = 9;
      
      private var fts1:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var fts2:FTextArea;
      
      private var jinSpr:Sprite;
      
      private var jin:MovieClip;
      
      private var muSpr:Sprite;
      
      private var mu:MovieClip;
      
      private var shuiSpr:Sprite;
      
      private var shui:MovieClip;
      
      private var huoSpr:Sprite;
      
      private var huo:MovieClip;
      
      private var tuSpr:Sprite;
      
      private var tu:MovieClip;
      
      private var fts13:FTextArea;
      
      private var fts3:FTextArea;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var fts4:FTextArea;
      
      public var checkZq:FCheckBox;
      
      private var fts5:FTextArea;
      
      public var checkDt:FCheckBox;
      
      private var fts6:FTextArea;
      
      public function JiuQuHuangHeZhen()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var $mask:Sprite;
         var loadUrl1:String = null;
         var loadUrl2:String = null;
         var loadUrl3:String = null;
         var loadUrl4:String = null;
         var loadUrl5:String = null;
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jiuquhuanghezhen/ui.jiuquhuanghezhen.bg.swf");
         this.bg.visible = true;
         this.bg.x = 0;
         this.bgSpr.addChild(this.bg);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 1 + 2;
         this.fc1.width = 403 - 4;
         this.fc1.height = 275;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 282 - 5;
         this.fc1.width = 403 - 4;
         this.fc1.height = 80 + 5 + 2;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.jinSpr = new Sprite();
         addChild(this.jinSpr);
         this.muSpr = new Sprite();
         addChild(this.muSpr);
         this.shuiSpr = new Sprite();
         addChild(this.shuiSpr);
         this.huoSpr = new Sprite();
         addChild(this.huoSpr);
         this.tuSpr = new Sprite();
         addChild(this.tuSpr);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 140 + 5 - 5 - 5;
         this.previousButton.y = 195 - 5 + 60;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 235 - 5 + 10;
         this.nextButton.y = 195 - 5 + 60;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ftaName = new FTextArea();
         with(this.ftaName)
         {
            filters = StaticValue.filter;
            x = 160 - 4;
            y = 195 - 5 + 60;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            width = 75 + 10;
            height = 16;
         }
         addChild(this.ftaName);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 335 - 23;
         this.lingWuBtn.y = 195 - 1 - 5 + 60;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         with(this.ft)
         {
            filters = StaticValue.filter;
            x = 185 + 25 - 15;
            y = 290;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加属性") + "</font>";
         }
         addChild(this.ft);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 185 + 25 - 15;
            y = 306;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("攻击防御生命");
         }
         addChild(this.fta1);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            filters = StaticValue.filter;
            x = 285 + 25 - 5;
            y = 306;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("内力体力");
         }
         addChild(this.fta3);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 5;
            y = 290;
            width = 190;
            height = 130;
            wordWrap = true;
         }
         addChild(this.fta2);
         this.jiuquhuangheTupo = new JiuQuHuangHeZhenTupoCanvas();
         addChild(this.jiuquhuangheTupo);
         this.jiuquhuangheTupo.x = 138;
         this.jiuquhuangheTupo.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.jiuquhuangheTupo.mask = $mask;
         addEventListener(UI_JIUQUHUANGHEZHEN_GUANBI_CLICK,this.aa1);
         loadUrl1 = GameConfig.fileBaseFolder + "res/ui/UIditu/jiuquhuanghezhen/jin.swf";
         this.jin = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl1)
            {
               return;
            }
            jin = _loc2_.content as MovieClip;
            if(jin)
            {
               jin.visible = false;
               jin.play();
               jin.x = 255;
               jin.y = 90;
               jinSpr.addChild(jin);
            }
         },null,false,loadUrl1);
         ToolTips.createToolTips(this.jinSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("金灵子：双击使用激活修为武学—恍若隔世。") + "<br>" + LanResManager.getLanCommonTextWords("技能效果：触发后可使对手产生遗忘状态且不可清除，持续10秒，冷却10秒。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         loadUrl2 = GameConfig.fileBaseFolder + "res/ui/UIditu/jiuquhuanghezhen/mu.swf";
         this.mu = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl2)
            {
               return;
            }
            mu = _loc2_.content as MovieClip;
            if(mu)
            {
               mu.visible = false;
               mu.play();
               mu.x = 255 + 27;
               mu.y = 90;
               muSpr.addChild(mu);
            }
         },null,false,loadUrl2);
         ToolTips.createToolTips(this.muSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("木灵子：双击使用激活修为武学—蝎尾蛇涎。") + "<br>" + LanResManager.getLanCommonTextWords("技能效果：触发后可使对手身中万毒状态且不可清除，持续10秒，冷却10秒。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         loadUrl3 = GameConfig.fileBaseFolder + "res/ui/UIditu/jiuquhuanghezhen/shui.swf";
         this.shui = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl3)
            {
               return;
            }
            shui = _loc2_.content as MovieClip;
            if(shui)
            {
               shui.visible = false;
               shui.play();
               shui.x = 255 + 27 * 2;
               shui.y = 90;
               shuiSpr.addChild(shui);
            }
         },null,false,loadUrl3);
         ToolTips.createToolTips(this.shuiSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("水灵子：双击使用激活修为武学—包罗万象。") + "<br>" + LanResManager.getLanCommonTextWords("技能效果：触发后可使对手全身冰冻状态且不可清除，持续10秒，冷却10秒。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         loadUrl4 = GameConfig.fileBaseFolder + "res/ui/UIditu/jiuquhuanghezhen/huo.swf";
         this.huo = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl4)
            {
               return;
            }
            huo = _loc2_.content as MovieClip;
            if(huo)
            {
               huo.visible = false;
               huo.play();
               huo.x = 255 + 27 * 3;
               huo.y = 90;
               huoSpr.addChild(huo);
            }
         },null,false,loadUrl4);
         ToolTips.createToolTips(this.huoSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("火灵子：双击使用激活修为武学—魂牵梦萦。") + "<br>" + LanResManager.getLanCommonTextWords("技能效果：触发后可使对手进入昏睡状态且不可清除，持续10秒，冷却10秒。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         loadUrl5 = GameConfig.fileBaseFolder + "res/ui/UIditu/jiuquhuanghezhen/tu.swf";
         this.tu = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl5)
            {
               return;
            }
            tu = _loc2_.content as MovieClip;
            if(tu)
            {
               tu.visible = false;
               tu.play();
               tu.x = 255 + 27 * 4;
               tu.y = 90 + 3;
               tuSpr.addChild(tu);
            }
         },null,false,loadUrl5);
         ToolTips.createToolTips(this.tuSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("土灵子：双击使用激活修为武学—天定魂魄。") + "<br>" + LanResManager.getLanCommonTextWords("技能效果：触发后可使对手陷入混乱状态且不可清除，持续10秒，冷却10秒。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts13 = new FTextArea();
         this.fts13.x = 280;
         this.fts13.y = 7 + 25 + 20;
         this.fts13.textColor = StaticValue.GREEN;
         this.fts13.width = 120;
         this.fts13.height = 20;
         this.fts13.autoSize = TextFieldAutoSize.LEFT;
         this.fts13.htmlText = LanResManager.getLanCommonTextWords("修为武学典籍");
         this.fts13.visible = false;
         addChild(this.fts13);
         ToolTips.createToolTips(this.fts13,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：80888亿、防御60888亿、血量80888亿、所有武功提升 600000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：激活修为武学典籍后，可双击使用金灵子、木灵子、水灵子、火灵子、土灵子激活") + "<br>" + LanResManager.getLanCommonTextWords("相应绝学技能；并且可双击使用武学潜能丹，增加自身的武学修为年限，每颗武学潜能丹，增") + "<br>" + LanResManager.getLanCommonTextWords("加一年的武学修为。") + "<br>" + LanResManager.getLanCommonTextWords("特殊技能：当自身的武学修为年限高于对手时，攻击时将可使对手100%命中修为绝学技能；当") + "<br>" + LanResManager.getLanCommonTextWords("自身的武学修为年限与对手持平时，攻击时将有较大的几率使对手命中修为绝学技能。") + "<br></font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.RED;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = "";
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("九曲迷魂大法：") + "<br>" + LanResManager.getLanCommonTextWords("攻击8888888、防御6888888、血量18888888、暴击888、闪避888、所有武功提升六层") + "<br>" + LanResManager.getLanCommonTextWords("特殊技能：攻击时有几率命中对手，令对手神智大乱，方向错乱，持续时间20秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuangSpr = new Sprite();
         addChild(this.kuangSpr);
         this.equipContainers = new Sprite();
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainers);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangHD.x = 10;
         this.kuangHD.y = 213;
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20;
         this.fts2.width = 140;
         this.fts2.height = 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("异兽护盾秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 400000层") + "<br>" + LanResManager.getLanCommonTextWords("异兽护盾 （特殊技能）：此为上古最强防御神技。被攻击时100%触发异兽护盾效果，持续15秒。") + "<br>" + LanResManager.getLanCommonTextWords("在此状态下自身所受到的所有百分比伤害总和都将降低至20%，乃克制百分比伤害之神技。且在此效") + "<br>" + LanResManager.getLanCommonTextWords("果内，每次受到对手攻击时都将反弹对手于十万丈之外，眩晕3秒。且自身每攻击对手一次都有几") + "<br>" + LanResManager.getLanCommonTextWords("率打碎对手所有勋章效果，不在触发，持续10秒，冷却60秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 10 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 120;
         this.fts3.height = 20;
         this.fts3.autoSize = TextFieldAutoSize.LEFT;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("夏日时装（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("夏日时装：可自由切换人物时装，给人物披上一层夏日的换装，悠悠夏日，透心凉，心飞扬。") + "<br>" + LanResManager.getLanCommonTextWords("寒冰护盾：激活夏日时装的玩家，攻击时有几率触发寒冰护盾，持续10秒；自身在此状态下，") + "<br>" + LanResManager.getLanCommonTextWords("寒气将在自身周围形气一个寒冰护盾，在护盾下自身将免疫所有负面状态；且寒冰护盾可冻") + "<br>" + LanResManager.getLanCommonTextWords("结自身的血量，同时将人物的血量翻倍成两条，对手须打破第一条血量后，才可以在直接对") + "<br>" + LanResManager.getLanCommonTextWords("第二条血量造成伤害。") + "<br>" + LanResManager.getLanCommonTextWords("寒冰无敌：当触发寒冰护盾的时候，每经过3秒都将在次触发一次寒冰无敌的状态，持续3秒。") + "<br>" + LanResManager.getLanCommonTextWords("寒冰护盾，无敌护体，双重效果。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 10;
         this.check.y = 50 + 20;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 70 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 120;
         this.fts4.height = 20;
         this.fts4.autoSize = TextFieldAutoSize.LEFT;
         this.fts4.htmlText = "囚牛（神兽）";
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层" + "<br>" + "囚牛：传说中的怪兽。龙生九子之一，是老大，形状为有鳞角的黄色小龙，喜音乐，蹲立于琴头" + "<br>" + "囚牛之音：攻击时有几率触发囚牛之音，持续10秒；对手在此状态下，将方向混乱，且每秒将受" + "<br>" + "到音律干扰，所有攻击能力下降至1点，无法使用任何技能；且在此状态下，自身周围形成一层" + "<br>" + "音壁护盾，使自身免疫对手的伤害和技能，持续10秒。" + "<br></font>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 100;
         this.checkZq.y = 70 + 20;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 70 + 20 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 120;
         this.fts5.height = 20;
         this.fts5.autoSize = TextFieldAutoSize.LEFT;
         this.fts5.htmlText = "Hắc Liên";
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Khi tấn công 100% kích hoạt kỹ năng Hắc Liên Hoa Quyết" + "<br>" + "Đối phương chịu Hắc Liên Hoa Quyết sẽ có xác suất nhận 1 trong 5 hiệu quả sau:" + "<br>" + "- Mất Toàn Bộ Thuộc Tính." + "<br>" + "- Mất Toàn Bộ Võ Công." + "<br>" + "- Mất Toàn Bộ Võ Phòng." + "<br>" + "- Mất Toàn Bộ Hiệu Quả Buff" + "<br>" + "- Mất Toàn Bộ Chiến Văn." + "<br>" + "Thời gian hiệu quả 10 giây. Thời gian chờ 180 giây." + "<br></font>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.x = 100;
         this.checkDt.y = 70 + 20 + 20;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 70 + 20 + 40;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 120;
         this.fts6.height = 20;
         this.fts6.autoSize = TextFieldAutoSize.LEFT;
         this.fts6.htmlText = "Vũ Khúc Ma Cầm";
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Vũ Khúc Ma Cầm – Đã lĩnh ngộ" + "<br>" + "Kháng 100% các hiệu quả kỹ năng: Ấn Soái VIP Tháng 3 (Bất Lợi), Ấn Soái VIP Tháng 2 (Bất lợi), " + "<br>" + "Kỉ Niệm Đại Lễ 2023 (Bất Lợi), Phá Thương Định Thế (Bất Lợi)." + "<br>" + "Hiệu quả không có thời gian chờ." + "<br></font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,24]));
               break;
            case this.checkZq:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,112]));
               break;
            case this.checkDt:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,114]));
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JIUQUHUANGHEZHEN_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JIUQUHUANGHEZHEN_XIAYIYE_CLICK));
               break;
            case this.lingWuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.JIUQUHUANGHEZHEN_LINGWU_SHOW));
               this.onShowLv(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.jiuquhuangheTupo._parent2 = param1;
         this.jiuquhuangheTupo._parent3 = this;
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         var bo:Boolean = param1;
         if(bo)
         {
            if(this.jiuquhuangheTupo.x == 138)
            {
               TweenMax.to(this.jiuquhuangheTupo,1,{"x":410});
               this.tupoBo = true;
            }
            this.lingWuBtn.enabled = false;
            this.previousButton.enabled = false;
            this.nextButton.enabled = false;
         }
         else
         {
            if(this.jiuquhuangheTupo.x == 410)
            {
               TweenMax.to(this.jiuquhuangheTupo,1,{
                  "x":138,
                  "onComplete":function():void
                  {
                     lingWuBtn.enabled = lingBo;
                  }
               });
               this.tupoBo = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JIUQUHUANGHEZHEN_ZIDONGTISHENG_CLICKJ,"",false));
            }
            this.jiuquhuangheTupo.check.selectState = false;
            this.jiuquhuangheTupo.check.enabled = true;
            this.jiuquhuangheTupo.zdlwBtn.enabled = true;
            if(this.dqId == 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(this.dqId == this.MAX_ZHAOSHI_COUNT)
            {
               this.nextButton.enabled = false;
               this.lingWuBtn.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
               this.lingWuBtn.enabled = true;
            }
         }
      }
      
      public function isJiuQuHuangHetupoCanvasShow() : Boolean
      {
         if(this.jiuquhuangheTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setJiuQuHuangHeZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:String) : void
      {
         this.jiuquhuangheTupo.setTupoInit(param7,param1,param2,param3,param4,param5,param6);
      }
      
      public function setJiuQuHuangHeZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jiuquhuangheTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setJiuQuHuangHeZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.jiuquhuangheTupo.setGoods(param1,param2);
      }
      
      public function setJiuQuHuangHeZhenLingwuBtn(param1:Boolean) : void
      {
         this.jiuquhuangheTupo.setTuPoBtn(param1);
      }
      
      public function setJiuQuHuangHeZhenEnabledFun() : void
      {
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.lingWuBtn.enabled = false;
         this.tarenBo = false;
      }
      
      public function setInitialize(param1:Boolean, param2:JiuQuHuangHeZhenVO) : void
      {
         this.isMain = param1;
         this.setMainInitialize(param2.isShuxingFanbei,param2.hp,param2.mp,param2.cp,param2.act,param2.def);
         this.setBowPage(param2.nowID,param2.nowLookingID);
         this.fta2.htmlText = "<textformat leading=\'1\'><font color=\'#e66a26\'>" + param2.miaoshu + "</font></textformat>";
         this.ftaName.htmlText = param2.nowLookingName;
         this.setJiHuo(param1);
         this.check.selectState = param2.isHuanZhuang;
         this.checkZq.selectState = param2.isHuanZhuang;
         this.checkDt.selectState = param2.isHuanZhuang;
      }
      
      private function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_YISHOUHUDUN_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_XIARISHIZHUANG_ID];
            this.check.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_XIARISHIZHUANG_ID];
            this.checkLabel.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_XIARISHIZHUANG_ID];
            this.fts13.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_XIUWEIWUXUEMIJI_ID];
            this.jin.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_JINLINGZI_ID];
            this.mu.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_MULINGZI_ID];
            this.shui.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_SHUILINGZI_ID];
            this.huo.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_HUOLINGZI_ID];
            this.tu.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_TULINGZI_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_QIUNIU_ID];
            this.checkZq.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_QIUNIU_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_MANTUOLUO_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_MANTUOLUO_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_MANTUOLUO_ID1];
         }
         else
         {
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_YISHOUHUDUN_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_XIARISHIZHUANG_ID];
            this.check.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_XIARISHIZHUANG_ID];
            this.checkLabel.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_XIARISHIZHUANG_ID];
            this.fts13.visible = GameState.dictMainStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_XIUWEIWUXUEMIJI_ID];
            this.jin.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_JINLINGZI_ID];
            this.mu.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_MULINGZI_ID];
            this.shui.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_SHUILINGZI_ID];
            this.huo.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_HUOLINGZI_ID];
            this.tu.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_TULINGZI_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_QIUNIU_ID];
            this.checkZq.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_QIUNIU_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_MANTUOLUO_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_MANTUOLUO_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUQUHUANGHEZHEN_MANTUOLUO_ID1];
         }
      }
      
      private function setMainInitialize(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:String = "";
         var _loc8_:String = "";
         _loc7_ += "<textformat leading=\'1\'><font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>";
         _loc8_ += "<textformat leading=\'1\'><font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>";
         if(param1)
         {
            _loc7_ += LanResManager.getLanCommonTextWords("攻击：") + param5 + " X2" + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param6 + " X2" + "<br>" + LanResManager.getLanCommonTextWords("生命：") + param2 + " X2" + "<br>";
            _loc8_ += LanResManager.getLanCommonTextWords("内力：") + param3 + " X2" + "<br>" + LanResManager.getLanCommonTextWords("体力：") + param4 + " X2";
         }
         else
         {
            _loc7_ += LanResManager.getLanCommonTextWords("攻击：") + param5 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param6 + "<br>" + LanResManager.getLanCommonTextWords("生命：") + param2 + "<br>";
            _loc8_ += LanResManager.getLanCommonTextWords("内力：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("体力：") + param4;
         }
         _loc7_ += "</font>";
         _loc7_ = _loc7_ + "</textformat>";
         _loc8_ += "</font>";
         _loc8_ = _loc8_ + "</textformat>";
         this.fta1.htmlText = _loc7_;
         this.fta3.htmlText = _loc8_;
      }
      
      private function setBowPage(param1:int, param2:int) : void
      {
         this.dqId = param2;
         if(this.gongImg != null && this.gongImg.parent != null)
         {
            removeChild(this.gongImg);
         }
         if(this.tarenBo)
         {
            if(param2 == 0)
            {
               if(this.gongImgObj[0] != null)
               {
                  this.gongImg = this.gongImgObj[0];
               }
               else
               {
                  this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/jiuquhuanghezhen/" + 0 + ".swf",404,274);
                  this.gongImgObj[0] = this.gongImg;
               }
            }
            else if(this.gongImgObj[param2] != null)
            {
               this.gongImg = this.gongImgObj[param2];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/jiuquhuanghezhen/" + param2 + ".swf",404,274);
               this.gongImgObj[param2] = this.gongImg;
            }
         }
         else if(param1 == 0)
         {
            if(this.gongImgObj[0] != null)
            {
               this.gongImg = this.gongImgObj[0];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/jiuquhuanghezhen/" + 0 + ".swf",404,274);
               this.gongImgObj[0] = this.gongImg;
            }
         }
         else if(this.gongImgObj[param1] != null)
         {
            this.gongImg = this.gongImgObj[param1];
         }
         else
         {
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/jiuquhuanghezhen/" + param1 + ".swf",404,274);
            this.gongImgObj[param1] = this.gongImg;
         }
         if(param2 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param2 == this.MAX_ZHAOSHI_COUNT)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         param2--;
         if(param1 > param2 && param2 >= 0 || param1 == 9)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.lingWuBtn.enabled = false;
            this.lingBo = false;
         }
         else if(param1 == param2)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.lingWuBtn.enabled = true;
            this.lingBo = true;
         }
         else
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.lingWuBtn.enabled = false;
            this.lingBo = false;
         }
         this.gongImg.x = 1;
         this.gongImg.y = 1;
         addChildAt(this.gongImg,1);
      }
      
      public function setJiuquJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.textColor = StaticValue.GREEN;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("九曲迷魂大法(已激活)");
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("九曲迷魂大法(未激活)");
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_JiuQuHuangHeZhen(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            if(_loc3_.res.position == ItemPositionRange.POSTION_JIUQUHUANGHE_LIANHUAN)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.kuangHD.x = 340;
               this.kuangHD.y = 10;
               this.equipContainers.addChild(this.kuangHD);
               _loc4_ = new ItemFace(_loc3_);
               _loc4_.x = 342;
               _loc4_.y = 12;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

