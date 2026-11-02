package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class BeiDouQiXingZhen extends Sprite
   {
      
      public static const UI_BEIDOUQIXINGZHEN_TUPO_CLOSE:String = "UI_BEIDOUQIXINGZHEN_TUPO_CLOSE";
      
      public var _$parent:DisplayObject;
      
      private var tf:TextFormat;
      
      private var tipCanvas:FCanvas;
      
      private var fc:FCanvas;
      
      private var tip:FTextArea;
      
      private var sel_Sk:int = -1;
      
      private var btn1:FSimpleButton;
      
      private var btn2:FSimpleButton;
      
      private var btn3:FSimpleButton;
      
      private var btn4:FSimpleButton;
      
      private var btn5:FSimpleButton;
      
      private var btn6:FSimpleButton;
      
      private var btn7:FSimpleButton;
      
      private var toolTipStr1:String = "1";
      
      private var toolTipStr2:String = "2";
      
      private var toolTipStr3:String = "3";
      
      private var toolTipStr4:String = "4";
      
      private var toolTipStr5:String = "5";
      
      private var toolTipStr6:String = "6";
      
      private var toolTipStr7:String = "7";
      
      private var lookingId:int = -1;
      
      private var jinengSpr:Sprite;
      
      private var xingwei:FTextArea;
      
      private var zengqiang:FTextArea;
      
      private var xuanzeBtn:SmallButton;
      
      private var tupoBtn:SmallButton;
      
      private var zuoshuxing:FTextArea;
      
      private var youshuxing:FTextArea;
      
      private var qixingzhen:FTextArea;
      
      private var beidouqixingzhenCanvas:BeiDouQiXingZhenTupoCanvas;
      
      private var beidouqixingjineng:BeiDouQiXingZhenJiNengPanel;
      
      private var ar:Array;
      
      private var dataArray:Array;
      
      private var bo:Boolean = true;
      
      private var bg:DisplayObject;
      
      private var bgSpr:Sprite;
      
      private var bd1Spr:Sprite;
      
      private var bd2Spr:Sprite;
      
      private var bd3Spr:Sprite;
      
      private var bd4Spr:Sprite;
      
      private var bd5Spr:Sprite;
      
      private var bd6Spr:Sprite;
      
      private var bd7Spr:Sprite;
      
      private var boll1:DisplayObject;
      
      private var boll2:DisplayObject;
      
      private var boll3:DisplayObject;
      
      private var boll4:DisplayObject;
      
      private var boll5:DisplayObject;
      
      private var boll6:DisplayObject;
      
      private var boll7:DisplayObject;
      
      private var TCball1:MovieClip;
      
      private var TCball2:MovieClip;
      
      private var TCball3:MovieClip;
      
      private var TCball4:MovieClip;
      
      private var TCball5:MovieClip;
      
      private var TCball6:MovieClip;
      
      private var TCball7:MovieClip;
      
      private var xuanzhongSpr:Sprite;
      
      private var boll:DisplayObject;
      
      private var biaoshi:int;
      
      private var ismain:Boolean;
      
      private var fts1:FTextArea;
      
      private var aoyijindu:int = 0;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var suipian:int = 0;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var fts6:FTextArea;
      
      private var check1:FCheckBox;
      
      private var checkLabel1:FLabel;
      
      private var fts7:FTextArea;
      
      private var check2:FCheckBox;
      
      private var fts8:FTextArea;
      
      private var checkZq2:FCheckBox;
      
      public function BeiDouQiXingZhen()
      {
         var img:Bitmap;
         var $mask:Sprite;
         var loadUrl:String = null;
         this.ar = [];
         this.dataArray = [];
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/beidouqixingzhen/bg.swf");
         this.bg.visible = true;
         this.bg.x = 2 + 1;
         this.bgSpr.addChild(this.bg);
         this.tip = new FTextArea();
         this.tip.multiline = true;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.wordWrap = true;
         this.tip.width = 240;
         this.tip.x = 7;
         this.tip.y = 3;
         this.tip.htmlText = "<font size=\'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天枢星") + "</font>";
         this.tipCanvas.addChild(this.tip);
         this.fc = new FCanvas();
         this.fc.x = 1;
         this.fc.y = 1;
         this.fc.width = 404;
         this.fc.height = 366;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.rotation = 90;
         img.height = 100;
         img.x = 180;
         img.y = 258 + 6;
         this.xingwei = new FTextArea();
         addChild(this.xingwei);
         this.xingwei.multiline = true;
         this.xingwei.autoSize = TextFieldAutoSize.LEFT;
         this.xingwei.wordWrap = true;
         this.xingwei.width = 120;
         this.xingwei.height = 20;
         this.xingwei.x = 22 + 15 - 10;
         this.xingwei.y = 270;
         this.xingwei.htmlText = "<font size=\'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天枢星") + "</font>";
         this.zengqiang = new FTextArea();
         addChild(this.zengqiang);
         this.zengqiang.multiline = true;
         this.zengqiang.autoSize = TextFieldAutoSize.LEFT;
         this.zengqiang.wordWrap = true;
         this.zengqiang.width = 120;
         this.zengqiang.height = 20;
         this.zengqiang.x = 68 + 15 - 6;
         this.zengqiang.y = 301 - 15 + 3 + 5 + 1;
         this.zengqiang.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("增强效果") + "<br></font><font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "9999</font>";
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 23;
         img.y = 293;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 24 + 1;
         this.jinengSpr.y = 294 + 1;
         addChild(this.jinengSpr);
         this.xuanzeBtn = new SmallButton();
         this.xuanzeBtn.label = LanResManager.getLanCommonTextWords("选择技能");
         addChild(this.xuanzeBtn);
         this.xuanzeBtn.x = 14;
         this.xuanzeBtn.y = 340;
         this.xuanzeBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.xuanzeBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
         this.xuanzeBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
         this.tupoBtn = new SmallButton();
         this.tupoBtn.label = LanResManager.getLanCommonTextWords("突破");
         addChild(this.tupoBtn);
         this.tupoBtn.x = 105;
         this.tupoBtn.y = 340;
         this.tupoBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.qixingzhen = new FTextArea();
         addChild(this.qixingzhen);
         this.qixingzhen.autoSize = TextFieldAutoSize.LEFT;
         this.qixingzhen.width = 220;
         this.qixingzhen.height = 20;
         this.qixingzhen.x = 190 - 10;
         this.qixingzhen.y = 270;
         this.qixingzhen.htmlText = "<font size=\'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("北斗七星阵总增强效果") + "</font>";
         this.zuoshuxing = new FTextArea();
         addChild(this.zuoshuxing);
         this.zuoshuxing.multiline = true;
         this.zuoshuxing.autoSize = TextFieldAutoSize.LEFT;
         this.zuoshuxing.wordWrap = true;
         this.zuoshuxing.width = 120;
         this.zuoshuxing.height = 20;
         this.zuoshuxing.x = 200;
         this.zuoshuxing.y = 300 - 5 - 3;
         this.zuoshuxing.htmlText = "<textformat leading=\'2\'><font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "10000<br>" + LanResManager.getLanCommonTextWords("暴击：") + "10000<br>" + LanResManager.getLanCommonTextWords("生命：") + "10000<br>" + LanResManager.getLanCommonTextWords("体力：") + "10000<br></font></textformat>";
         this.youshuxing = new FTextArea();
         addChild(this.youshuxing);
         this.youshuxing.multiline = true;
         this.youshuxing.autoSize = TextFieldAutoSize.LEFT;
         this.youshuxing.wordWrap = true;
         this.youshuxing.width = 120;
         this.youshuxing.height = 20;
         this.youshuxing.x = 300;
         this.youshuxing.y = 300 - 5 - 3;
         this.youshuxing.htmlText = "<textformat leading=\'2\'><font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御：") + "10000<br>" + LanResManager.getLanCommonTextWords("闪避：") + "10000<br>" + LanResManager.getLanCommonTextWords("内力：") + "10000<br></font></textformat>";
         this.beidouqixingzhenCanvas = new BeiDouQiXingZhenTupoCanvas();
         addChild(this.beidouqixingzhenCanvas);
         this.beidouqixingzhenCanvas.x = -10;
         this.beidouqixingzhenCanvas.y = 380;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = -10;
         $mask.y = 270 - 1;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,425,110);
            endFill();
         }
         this.beidouqixingzhenCanvas.mask = $mask;
         addEventListener(UI_BEIDOUQIXINGZHEN_TUPO_CLOSE,this.onCloseTupo);
         this.bd1Spr = new Sprite();
         this.bd2Spr = new Sprite();
         this.bd3Spr = new Sprite();
         this.bd4Spr = new Sprite();
         this.bd5Spr = new Sprite();
         this.bd6Spr = new Sprite();
         this.bd7Spr = new Sprite();
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/beidouqixingzhen/tianchong.swf";
         this.TCball1 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball1 = _loc2_.content as MovieClip;
            if(TCball1)
            {
               TCball1.visible = false;
               TCball1.stop();
               bd1Spr.addChildAt(TCball1,0);
            }
         },null,false,loadUrl);
         this.TCball2 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball2 = _loc2_.content as MovieClip;
            if(TCball2)
            {
               TCball2.visible = false;
               TCball2.stop();
               bd2Spr.addChildAt(TCball2,0);
            }
         },null,false,loadUrl);
         this.TCball3 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball3 = _loc2_.content as MovieClip;
            if(TCball3)
            {
               TCball3.visible = false;
               TCball3.stop();
               bd3Spr.addChildAt(TCball3,0);
            }
         },null,false,loadUrl);
         this.TCball4 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball4 = _loc2_.content as MovieClip;
            if(TCball4)
            {
               TCball4.visible = false;
               TCball4.stop();
               bd4Spr.addChildAt(TCball4,0);
            }
         },null,false,loadUrl);
         this.TCball5 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball5 = _loc2_.content as MovieClip;
            if(TCball5)
            {
               TCball5.visible = false;
               TCball5.stop();
               bd5Spr.addChildAt(TCball5,0);
            }
         },null,false,loadUrl);
         this.TCball6 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball6 = _loc2_.content as MovieClip;
            if(TCball6)
            {
               TCball6.visible = false;
               TCball6.stop();
               bd6Spr.addChildAt(TCball6,0);
            }
         },null,false,loadUrl);
         this.TCball7 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball7 = _loc2_.content as MovieClip;
            if(TCball7)
            {
               TCball7.visible = false;
               TCball7.stop();
               bd7Spr.addChildAt(TCball7,0);
            }
         },null,false,loadUrl);
         this.bd1Spr.x = 30;
         this.bd1Spr.y = 180;
         addChild(this.bd1Spr);
         this.bd2Spr.x = 25;
         this.bd2Spr.y = 120;
         addChild(this.bd2Spr);
         this.bd3Spr.x = 88;
         this.bd3Spr.y = 88;
         addChild(this.bd3Spr);
         this.bd4Spr.x = 140;
         this.bd4Spr.y = 135;
         addChild(this.bd4Spr);
         this.bd5Spr.x = 220;
         this.bd5Spr.y = 110;
         addChild(this.bd5Spr);
         this.bd6Spr.x = 290;
         this.bd6Spr.y = 120;
         addChild(this.bd6Spr);
         this.bd7Spr.x = 340;
         this.bd7Spr.y = 60;
         addChild(this.bd7Spr);
         this.xuanzhongSpr = new Sprite();
         this.xuanzhongSpr.x = 30;
         this.xuanzhongSpr.y = 180;
         this.xuanzhongSpr.visible = false;
         addChild(this.xuanzhongSpr);
         this.boll = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/beidouqixingzhen/xuanzhong.swf");
         this.boll.visible = true;
         this.boll.addEventListener(MouseEvent.CLICK,this.onClick);
         this.boll.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.boll.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("北斗七星终极奥义（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击50000000000 防御30000000000 血量60000000000 暴击28888 闪避28888 所有武功提升30000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：激活北斗七星终极奥义属性后将同时激活0%的修炼进度，双击使用北斗奥义晶石每个可以提升") + "<br>" + LanResManager.getLanCommonTextWords("5%的修炼进度，当进度达到100%时获得特殊技能——七星护体") + "<br>" + LanResManager.getLanCommonTextWords("当前修炼进度为") + aoyijindu * 5 + "%<br>" + LanResManager.getLanCommonTextWords("七星护体（特殊技能）：七星护体之下，将可以100%免疫对手的朱雀战纹、勋章及功法的反弹伤害效果！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("七星雷劫（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升人物属性3000亿攻击  2000亿防御 以及 10000亿血量") + "<br>" + LanResManager.getLanCommonTextWords("七星雷劫技能 —— 攻击将有较高几率召唤北斗七星之陨石天降技能，造成对手遭雷劫麻痹") + "<br>" + LanResManager.getLanCommonTextWords("定身3秒，且受到七颗陨石天降伤害，每颗陨石将对对手造成十倍暴击伤害效果。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("金翅大鹏王（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("金翅大鹏（特殊技能）：被攻击时有几率召唤金翅大鹏出战，持续10秒。使自身五格范围内所有对手") + "<br>" + LanResManager.getLanCommonTextWords("眩晕，陷入沉睡，且每秒掉20%血量，持续5秒。当对手沉睡解除后将瞬间掉60%血量，禁跳5秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 20 + 40;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("粉色小可爱");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("坐骑换装：可自由切换坐骑换装，将坐骑变幻成一只娇小的萌娃外观。") + "<br>" + LanResManager.getLanCommonTextWords("艳丽妖魅：激活粉色小可爱的玩家，身上散发一个妖魅之气，犹如狐仙附体；攻击时") + "<br>" + LanResManager.getLanCommonTextWords("有几率触发艳丽妖魅，持续10秒；对手在此状态下，将受到妖魅的诱惑，双眼发直，") + "<br>" + LanResManager.getLanCommonTextWords("所有的攻击操作都将立即停止；在艳丽妖魅的状态下，对手的所有勋章都将失效，不") + "<br>" + LanResManager.getLanCommonTextWords("在触发；且命中的艳丽妖魅的玩家，每受到一次攻击都将无力反抗，瞬间掉血70%，") + "<br>" + LanResManager.getLanCommonTextWords("当对手受到5次攻击时，灵魂将被妖魅吸收，定身于原地无法移动，持续8秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 10 + 70;
         this.checkZq.y = 7 + 20 + 40;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 7 + 60 + 40;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170 + 20;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("白银专属卡（已激活）");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击88888亿 防御62888亿 血量90888亿 暴击 88888闪避88888 ") + "<br>" + LanResManager.getLanCommonTextWords("所有武功1400000层") + "<br>" + LanResManager.getLanCommonTextWords("激活白银专属的玩家，可开启白银等级养成功功能且白银等级技能。") + "<br>" + LanResManager.getLanCommonTextWords("每提升一个等级需要消耗200个白银碎片，白银每升一级可获得一个白银技能。") + "<br>" + LanResManager.getLanCommonTextWords("每次消耗白银碎片一个增加攻击1000亿，所有武功提升10000层，战斗力1亿。") + "<br>" + "</font><font color=\'" + (suipian > 199 ? StaticValue.GREEN_HTML : StaticValue.WHITE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("白银一级：攻击时有几率触发白银一级，持续8秒；每攻击一次都可瞬间震退5格内所有玩家。") + "<br>" + "</font><font color=\'" + (suipian > 399 ? StaticValue.GREEN_HTML : StaticValue.WHITE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("白银二级：攻击时有几率触发白银二级，持续8秒；每攻击一次都可封印5格范围内所有玩家技能。") + "<br>" + "</font><font color=\'" + (suipian > 599 ? StaticValue.GREEN_HTML : StaticValue.WHITE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("白银三级：攻击时有几率触发白银三级，持续8秒；每攻击一次都可冻结5格范围内所有玩家勋章。") + "<br>" + "</font><font color=\'" + (suipian > 799 ? StaticValue
            .GREEN_HTML : StaticValue.WHITE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("白银四级：被攻击时有几率触发白银四银，持续8秒；自身在此状态下，将不在受到任何伤害。") + "<br>" + "</font><font color=\'" + (suipian > 999 ? StaticValue.GREEN_HTML : StaticValue.WHITE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("白银五级：当白银等级达到五级时，可获得白银满级特权，自身的所有白银技能触发几率翻倍。") + "<br>" + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("颗白银碎片") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + suipian * 1000 + LanResManager.getLanCommonTextWords("亿，所有武功") + suipian * 10000 + LanResManager.getLanCommonTextWords("层，战斗力") + suipian + LanResManager.getLanCommonTextWords("亿") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8;
         this.equipContainers.y = 12 + 30 + 135 + 35;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         this.fts6 = new FTextArea();
         this.fts6.x = 10 + 280 - 16;
         this.fts6.y = 7 + 60 + 40 + 20 + 70 + 33;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 110;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("蜀山神器");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("至尊神器：蜀山神器乃至尊武器，不管人物当前佩戴哪一把神器，只要切换蜀山神器，") + "<br>" + LanResManager.getLanCommonTextWords("显示的神器外观只能是蜀山神器。") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：提升人物攻速+ 388，施发速度+10% 每次移动都有几率触发灵动一闪，可") + "<br>" + LanResManager.getLanCommonTextWords("瞬间闪烁清除所有负面，且移动速度翻倍提高。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check1 = new FCheckBox();
         this.check1.x = 120 + 280 - 55 - 16;
         this.check1.y = 7 + 60 + 40 + 20 + 70 + 33;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts7 = new FTextArea();
         this.fts7.x = 10 + 280 - 16;
         this.fts7.y = 7 + 60 + 40 + 20 + 70 + 33 - 60 + 32;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 110;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("白衣仙子");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("仙女守护：拥有白衣仙子的玩家，可永久守护在持有者的玩家。") + "<br>" + LanResManager.getLanCommonTextWords("仙女金光：获得仙女守护的玩家，攻击时或被攻击时有几率触发仙女金光，") + "<br>" + LanResManager.getLanCommonTextWords("持续10秒；在此状态下，可瞬间下降对手50%攻击速度和移动速度（金光不") + "<br>" + LanResManager.getLanCommonTextWords("可清除），且当状态解除后，金光可净化范围5格内的所有对手，可将对手") + "<br>" + LanResManager.getLanCommonTextWords("的攻") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 120 + 280 - 55 - 16;
         this.check2.y = 7 + 60 + 40 + 20 + 70 + 33 - 60 + 32;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts8 = new FTextArea();
         this.fts8.x = 10;
         this.fts8.y = 7 + 20 + 40 + 25 + 144;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 110;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("龙之子（神兽）");
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("龙之子：龙神之子，金黄加身，金光芒芒，脚踩电云，威风凛凛，人物可自己骑乘。") + "<br>" + LanResManager.getLanCommonTextWords("龙之嚎吼：攻击时有几率触发龙之嚎吼，持续10秒；在此状态下，所有对手都无法靠近龙之子，") + "<br>" + LanResManager.getLanCommonTextWords("靠近者都将瞬间被反弹击退，且嚎吼使对手瞬间失去知觉无法动弹；且自身在龙之子的光芒下，") + "<br>" + LanResManager.getLanCommonTextWords("BUFF期间内，将不受到任何人的伤害，金黄加身，无敌一切。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq2 = new FCheckBox();
         addChild(this.checkZq2);
         this.checkZq2.x = 100;
         this.checkZq2.y = 7 + 20 + 40 + 25 + 144;
         this.checkZq2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this.checkZq2.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,23]));
               break;
            case this.checkZq2:
               this.checkZq.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq2.selectState,95]));
               break;
            case this.check1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check1.selectState,39]));
               break;
            case this.check2:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check2.selectState,53]));
         }
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.target.name);
         this.biaoshi = _loc2_;
         this.setXingWei(this.biaoshi);
         this.showTuPoPanel(false);
      }
      
      private function tupochushihua(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(this["boll" + String(_loc2_ + 1)])
            {
               if(this["boll" + String(_loc2_ + 1)].parent)
               {
                  this["boll" + String(_loc2_ + 1)].parent.removeChild(this["boll" + String(_loc2_ + 1)]);
               }
            }
            this["boll" + String(_loc2_ + 1)] = null;
            if(param1[_loc2_].learn == 2)
            {
               this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/beidouqixingzhen/yitupo.swf");
            }
            else
            {
               this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/beidouqixingzhen/weitupo.swf");
            }
            this["boll" + String(_loc2_ + 1)].visible = true;
            this["boll" + String(_loc2_ + 1)].name = String(_loc2_);
            this["boll" + String(_loc2_ + 1)].addEventListener(MouseEvent.CLICK,this.onClick);
            this["boll" + String(_loc2_ + 1)].addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
            this["boll" + String(_loc2_ + 1)].addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
            this["bd" + String(_loc2_ + 1) + "Spr"].buttonMode = true;
            this["bd" + String(_loc2_ + 1) + "Spr"].useHandCursor = true;
            this["bd" + String(_loc2_ + 1) + "Spr"].addChild(this["boll" + String(_loc2_ + 1)]);
            if(param1[_loc2_].skill != 0)
            {
               this["TCball" + String(_loc2_ + 1)].x = -10 - 4;
               this["TCball" + String(_loc2_ + 1)].y = -15 - 3 + 1 + 1 + 1;
               this["TCball" + String(_loc2_ + 1)].visible = true;
            }
            else
            {
               this["TCball" + String(_loc2_ + 1)].visible = false;
            }
            _loc2_++;
         }
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.xuanzeBtn.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip0();
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.xuanzeBtn.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
         }
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.xuanzeBtn:
               this.showbeidouqixingPanel();
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BEIDOUQIXINGZHEN_XUANZHEBTN_CLICKB,"",this.lookingId));
               break;
            case this.tupoBtn:
               this.showTuPoPanel(this.bo);
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BEIDOUQIXINGZHEN_TUPO_CLICK));
         }
      }
      
      private function showTip0() : void
      {
         this.tip.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("突破星位后，可以将技能放入星位中以获得高额属性加成！") + "<br><br>" + LanResManager.getLanCommonTextWords("可以从以下技能中进行选择：") + "<br>" + LanResManager.getLanCommonTextWords("丹田吐纳功、玄门吐纳功、金鲤行波、玄元经、小无相功、地灵真经、战气心诀。") + "<br><br></font>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("选择武功后该武功提供的属性将会被极大地放大，并且该武功每提升一层，所获得的属性也会跟着大量提升。") + "<br><br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注意：每种武功只能放置于一个星位，不能同时放置于多个星位！") + "<br>" + LanResManager.getLanCommonTextWords("星位加成仅支持武功的前400层，400层之后的武功属性不予加成！") + "</font>";
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:int = parseInt(param1.currentTarget.name);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               if(this.dataArray == null || this.dataArray.length == 0)
               {
                  return;
               }
               this.dataArray[_loc2_].name;
               _loc3_ = "";
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font size=\'15\'color=\'" + StaticValue.PURPLE_HTML + "\'>" + this.dataArray[_loc2_].name + "</font><br>";
               _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + this.dataArray[_loc2_].miaoshu + "</font><br>";
               if(this.dataArray[_loc2_].learn == 0)
               {
                  if(_loc2_ == 0)
                  {
                     _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("突破前提： ") + LanResManager.getLanCommonTextWords("无") + "<br></font>";
                  }
                  else
                  {
                     _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("突破前提：") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.dataArray[_loc2_].qianti + "</font><br>";
                  }
                  _loc3_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("尚未突破") + "</font><br>";
               }
               if(this.dataArray[_loc2_].learn == 1)
               {
                  if(_loc2_ == 0)
                  {
                     _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("突破前提： ") + LanResManager.getLanCommonTextWords("无") + "<br></font>";
                  }
                  else
                  {
                     _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("突破前提：") + "</font><font color=\'" + StaticValue.RED_HTML + "\'>" + this.dataArray[_loc2_].qianti + "</font><br>";
                  }
                  _loc3_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("尚未突破") + "</font><br>";
               }
               if(this.dataArray[_loc2_].learn == 2)
               {
                  if(_loc2_ == 0)
                  {
                     _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("突破前提： ") + LanResManager.getLanCommonTextWords("无") + "<br></font>";
                  }
                  else
                  {
                     _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("突破前提：") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.dataArray[_loc2_].qianti + "</font><br>";
                  }
                  _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("已突破") + "</font><br>";
               }
               _loc3_ += "</textformat>";
               this.showTip(_loc3_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.x = Tools.currentStage.mouseX + 15;
                  this.tipCanvas.y = Tools.currentStage.mouseY + 12;
               }
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4 - 100 - 30;
         this.tipCanvas.height = this.tip.height + 4 + 5;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function setSkill(param1:Skill) : void
      {
         var _loc3_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc2_:Skill = param1;
         _loc2_.isLearn = 1;
         _loc3_ = new ItemFace(_loc2_);
         _loc3_.filters = [];
         _loc3_.setShowCount(false);
         _loc3_.removeListener();
         this.jinengSpr.addChild(_loc3_);
      }
      
      private function setZuoShuxingJiacheng(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.zuoshuxing.htmlText = "<textformat leading=\'2\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + param1 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("体力:") + param4 + "</font></textformat>";
      }
      
      private function setYouShuxingJiacheng(param1:int, param2:int, param3:int) : void
      {
         this.youshuxing.htmlText = "<textformat leading=\'2\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御:") + param1 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("内力:") + param3 + "</font></textformat>";
      }
      
      private function setXingWei(param1:int) : void
      {
         var _loc2_:Skill = null;
         this.lookingId = param1;
         this.boll.visible = true;
         this.boll.name = String(this.lookingId);
         this["bd" + String(this.lookingId + 1) + "Spr"].addChild(this.boll);
         if(this.dataArray[param1].learn == 2)
         {
            this.xuanzeBtn.enabled = true;
            this.tupoBtn.enabled = false;
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("已突破");
         }
         if(this.dataArray[param1].learn == 1)
         {
            this.xuanzeBtn.enabled = false;
            this.tupoBtn.enabled = false;
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("未突破");
         }
         if(this.dataArray[param1].learn == 0)
         {
            this.xuanzeBtn.enabled = false;
            this.tupoBtn.enabled = true;
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("突破");
         }
         if(this.ismain == false)
         {
            this.xuanzeBtn.enabled = false;
            this.tupoBtn.enabled = false;
         }
         this.xingwei.htmlText = "<font size=\'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + this.dataArray[param1].name + "</font>";
         this.zengqiang.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + this.dataArray[param1].xiaoguo + "</font>";
         if(this.dataArray[param1].skill == 0)
         {
            this.zengqiang.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("增强效果") + "</font>";
            while(this.jinengSpr.numChildren > 0)
            {
               this.jinengSpr.removeChildAt(0);
            }
            return;
         }
         if(this.dataArray[param1].skill == 80200135)
         {
            this.dataArray[param1].xiaoguo = LanResManager.getLanCommonTextWords("全属性增强");
         }
         this.zengqiang.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("增强效果") + "<br></font><font  color=\'" + StaticValue.GREEN_HTML + "\'>" + this.dataArray[param1].xiaoguo + "</font>";
         if(this.dataArray[param1].skill == 0)
         {
            return;
         }
         _loc2_ = new Skill(this.dataArray[param1].skill);
         this.setSkill(_loc2_);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.beidouqixingzhenCanvas._parent2 = param1;
         this.beidouqixingzhenCanvas._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:int, param3:int, param4:Array, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean, param13:Boolean, param14:Boolean, param15:Boolean) : void
      {
         this.ismain = param1;
         this.dataArray = param4;
         this.tupochushihua(param4);
         this.setXingWei(param2);
         this.setZuoShuxingJiacheng(param5,param8,param7,param11);
         this.setYouShuxingJiacheng(param6,param9,param10);
         this.setJiHuo(this.ismain);
         this.checkZq.selectState = param12;
         this.checkZq2.selectState = param15;
         this.check1.selectState = param13;
         this.check2.selectState = param14;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_ZHONGJIAOYI_ID];
            this.aoyijindu = GameState.dictMainStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_AOYIJINGSHI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_QIXINGLEIJIE_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.BEIDOUQIXING_JINCHIDAPENG_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_FENSE_ID])
            {
               this.fts4.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.checkZq.visible = false;
            }
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_BAIYINZHUANSHU_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_BAIYINSUIPIAN_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_BAIYIXIANZI_ID];
            this.check2.visible = GameState.dictMainStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_BAIYIXIANZI_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_LONGZHIZI_ID];
            this.checkZq2.visible = GameState.dictMainStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_LONGZHIZI_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_ZHONGJIAOYI_ID];
            this.aoyijindu = GameState.dictTargetStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_AOYIJINGSHI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_QIXINGLEIJIE_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIDOUQIXING_JINCHIDAPENG_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_FENSE_ID])
            {
               this.fts4.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.checkZq.visible = false;
            }
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_BAIYINZHUANSHU_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_BAIYINSUIPIAN_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_BAIYIXIANZI_ID];
            this.check2.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_BAIYIXIANZI_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_LONGZHIZI_ID];
            this.checkZq2.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIDOUQIXINGZHEN_LONGZHIZI_ID];
         }
      }
      
      public function setTupoInit(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.beidouqixingzhenCanvas.setTupoInit(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.beidouqixingzhenCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.beidouqixingzhenCanvas.y == 380)
            {
               TweenMax.to(this.beidouqixingzhenCanvas,1,{"y":273});
            }
         }
         else if(this.beidouqixingzhenCanvas.y == 273)
         {
            TweenMax.to(this.beidouqixingzhenCanvas,1,{"y":380});
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BEIDOUQIXINGZHEN_ZIDONGTUPO_CLICK,"",false));
         }
      }
      
      public function setZdtsBtnLabel(param1:Boolean) : void
      {
         this.beidouqixingzhenCanvas.setZdtsBtnLabel(param1);
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.beidouqixingzhenCanvas.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function showbeidouqixingPanel() : void
      {
         if(this.beidouqixingjineng == null)
         {
            this.beidouqixingjineng = new BeiDouQiXingZhenJiNengPanel();
            this.beidouqixingjineng.$parent = this._$parent;
            this.beidouqixingjineng.$parent1 = this;
         }
         this.beidouqixingjineng.visible = true;
         POPWindowManager.showWindow(this.beidouqixingjineng);
      }
      
      public function baidouqixingPanelClose() : void
      {
         this.beidouqixingjineng.onClose();
      }
      
      public function setSkillArr(param1:Array) : void
      {
         this.beidouqixingjineng.setJiNeng(this.lookingId,param1);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.beidouqixingzhenCanvas.setGoods(param1,param2);
      }
      
      public function setEnableFun() : void
      {
         this.tupoBtn.enabled = false;
         this.xuanzeBtn.enabled = false;
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_BeiDouQiXingZhen(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD.x = 0;
         this.kuangHD.y = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_BEIDOUQIXINGZHEN_SHUSHANSHENQI)
            {
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.fts6.visible = true;
                  this.check1.visible = true;
               }
               else
               {
                  this.fts6.visible = false;
                  this.check1.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

