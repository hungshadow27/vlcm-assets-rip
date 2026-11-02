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
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.emozhiyi.model.info.EMoZhiYiVo;
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
   import gs.TweenMax;
   
   public class EMoZhiYi extends Sprite
   {
      
      public static const UI_EMOZHIYI_GUANBI_CLICK:String = "UI_EMOZHIYI_GUANBI_CLICK";
      
      public var _$parent:DisplayObject;
      
      private var feixingBtn:FSimpleButton;
      
      private var hechengBtn:SmallButton;
      
      private var jinjieBtn:SmallButton;
      
      private var jinjieBo:Boolean;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var shiyong:FTextArea;
      
      private var laiyuan:FTextArea;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var nengli:FTextArea;
      
      private var isMainChar:Boolean;
      
      private var emozhiyiTupo:EMoZhiYiTupoCanvas;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bg1Spr:Sprite;
      
      private var bg2Spr:Sprite;
      
      private var bg3Spr:Sprite;
      
      private var bg4Spr:Sprite;
      
      private var bg5Spr:Sprite;
      
      private var bg6Spr:Sprite;
      
      private var bg7Spr:Sprite;
      
      private var bg8Spr:Sprite;
      
      private var boll1:DisplayObject;
      
      private var boll2:DisplayObject;
      
      private var boll3:DisplayObject;
      
      private var boll4:DisplayObject;
      
      private var boll5:DisplayObject;
      
      private var boll6:DisplayObject;
      
      private var boll7:DisplayObject;
      
      private var boll8:DisplayObject;
      
      private var boll:DisplayObject;
      
      private var TCball1:MovieClip;
      
      private var TCball2:MovieClip;
      
      private var TCball3:MovieClip;
      
      private var TCball4:MovieClip;
      
      private var TCball5:MovieClip;
      
      private var TCball6:MovieClip;
      
      private var TCball7:MovieClip;
      
      private var TCball8:MovieClip;
      
      private var barBg1:Bitmap;
      
      private var barBar1:ColorBar;
      
      private var barBar2:ColorBar;
      
      private var barBar3:ColorBar;
      
      private var barBar4:ColorBar;
      
      private var barBar5:ColorBar;
      
      private var barBar6:ColorBar;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var fc1:FCanvas;
      
      private var YulingHecheng:YuLingHeChengPanel;
      
      private var bgSpr:Sprite;
      
      private var bg:DisplayObject;
      
      private var yanhuaMc:MovieClip;
      
      private var jinjieMc:MovieClip;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var suipian:int = 0;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var suihun:int = 0;
      
      private var fts6:FTextArea;
      
      private var canjuan:int = 0;
      
      public function EMoZhiYi()
      {
         var ft1:FTextArea;
         var ft2:FTextArea;
         var ft3:FTextArea;
         var ft4:FTextArea;
         var $mask:Sprite;
         var loadUrl:String = null;
         var i:int = 0;
         super();
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/emozhiyi/bg.swf");
         this.bg.visible = true;
         this.bg.x = -1 + 4 - 1 - 1;
         this.bg.y = 1 + 4 - 2;
         this.bgSpr.addChild(this.bg);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 52 + 15;
         this.bloodMcSpr.y = 60;
         addChild(this.bloodMcSpr);
         this.bg1Spr = new Sprite();
         this.bg2Spr = new Sprite();
         this.bg3Spr = new Sprite();
         this.bg4Spr = new Sprite();
         this.bg5Spr = new Sprite();
         this.bg6Spr = new Sprite();
         this.bg7Spr = new Sprite();
         this.bg8Spr = new Sprite();
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/emozhiyi/huoyan.swf";
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
               TCball1.x = -35 - 3;
               TCball1.y = -31;
               bg1Spr.addChildAt(TCball1,0);
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
               TCball2.x = -35 - 3;
               TCball2.y = -31;
               bg2Spr.addChildAt(TCball2,0);
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
               TCball3.x = -35 - 3;
               TCball3.y = -31;
               bg3Spr.addChildAt(TCball3,0);
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
               TCball4.x = -35 - 3;
               TCball4.y = -31;
               bg4Spr.addChildAt(TCball4,0);
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
               TCball5.x = -35 - 3;
               TCball5.y = -31;
               bg5Spr.addChildAt(TCball5,0);
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
               TCball6.x = -35 - 3;
               TCball6.y = -31;
               bg6Spr.addChildAt(TCball6,0);
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
               TCball7.x = -35 - 3;
               TCball7.y = -31;
               bg7Spr.addChildAt(TCball7,0);
            }
         },null,false,loadUrl);
         this.TCball8 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball8 = _loc2_.content as MovieClip;
            if(TCball8)
            {
               TCball8.visible = false;
               TCball8.stop();
               TCball8.x = -35 - 3;
               TCball8.y = -31;
               bg8Spr.addChildAt(TCball8,0);
            }
         },null,false,loadUrl);
         this.bg1Spr.x = 30;
         this.bg1Spr.y = 180 - 10;
         addChild(this.bg1Spr);
         this.bg2Spr.x = 25 + 30 - 5;
         this.bg2Spr.y = 120 - 10 - 10;
         addChild(this.bg2Spr);
         this.bg3Spr.x = 88 - 16 + 15;
         this.bg3Spr.y = 88 - 52 + 12 - 10;
         addChild(this.bg3Spr);
         this.bg4Spr.x = 140;
         this.bg4Spr.y = 135 - 120 - 10;
         addChild(this.bg4Spr);
         this.bg5Spr.x = 220;
         this.bg5Spr.y = 135 - 120 - 10;
         addChild(this.bg5Spr);
         this.bg6Spr.x = 290 + 10 - 25;
         this.bg6Spr.y = 88 - 52 + 12 - 10;
         addChild(this.bg6Spr);
         this.bg7Spr.x = 340 - 25;
         this.bg7Spr.y = 120 - 10 - 10;
         addChild(this.bg7Spr);
         this.bg8Spr.x = 340;
         this.bg8Spr.y = 180 - 10;
         addChild(this.bg8Spr);
         this.feixingBtn = new FSimpleButton();
         addChild(this.feixingBtn);
         this.feixingBtn.x = 35 + 108 + 5;
         this.feixingBtn.y = 160 + 35;
         this.feixingBtn.skin = "feixingBtn";
         this.feixingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.feixingBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onFeixingTip);
         this.feixingBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onFeixingTip);
         this.hechengBtn = new SmallButton();
         this.hechengBtn.label = LanResManager.getLanCommonTextWords("羽灵合成");
         addChild(this.hechengBtn);
         this.hechengBtn.x = 150 + 150 + 30;
         this.hechengBtn.y = 190 + 140 + 5;
         this.hechengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jinjieBtn = new SmallButton();
         this.jinjieBtn.label = LanResManager.getLanCommonTextWords("羽翼进阶");
         addChild(this.jinjieBtn);
         this.jinjieBtn.x = 270 + 30 + 30;
         this.jinjieBtn.y = 190 + 100 + 15 + 3 + 3;
         this.jinjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 30 + 260 - 12 - 20;
         this.check.y = 190 + 10 + 17;
         this.check.enabled = true;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("显示外观");
         }
         addChild(this.checkLabel);
         ft1 = new FTextArea();
         ft1.multiline = true;
         ft1.filters = StaticValue.filter;
         ft1.width = 100;
         ft1.height = 110;
         ft1.x = 15;
         ft1.y = 240 - 25 + 25 + 3;
         addChild(ft1);
         ft1.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("羽翼属性") + "</font>";
         this.shiyong = new FTextArea();
         this.shiyong.multiline = true;
         this.shiyong.filters = StaticValue.filter;
         this.shiyong.width = 160;
         this.shiyong.height = 50;
         this.shiyong.wordWrap = true;
         this.shiyong.x = 30 + 100 - 40 - 70;
         this.shiyong.y = 240 - 24 + 85 + 20 - 9;
         addChild(this.shiyong);
         this.laiyuan = new FTextArea();
         this.laiyuan.multiline = true;
         this.laiyuan.filters = StaticValue.filter;
         this.laiyuan.width = 100;
         this.laiyuan.height = 25;
         this.laiyuan.x = 30 + 200 + 40 - 250;
         this.laiyuan.y = 240 - 24 + 100 + 20 + 9;
         addChild(this.laiyuan);
         this.laiyuan.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a><u>" + LanResManager.getLanCommonTextWords("查看羽灵来源") + "</u></a></font>";
         this.laiyuan.addEventListener(MouseEvent.MOUSE_OVER,this.onFt2Tip);
         this.laiyuan.addEventListener(MouseEvent.MOUSE_OUT,this.onFt2Tip);
         ft2 = new FTextArea();
         ft2.multiline = true;
         ft2.filters = StaticValue.filter;
         ft2.width = 100;
         ft2.height = 60;
         ft2.x = 15;
         ft2.y = 260 - 25 + 25;
         addChild(ft2);
         ft2.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命体力攻击") + "</font>";
         ft3 = new FTextArea();
         ft3.multiline = true;
         ft3.filters = StaticValue.filter;
         ft3.width = 100;
         ft3.height = 60;
         ft3.x = 200;
         ft3.y = 260 - 25 + 25;
         addChild(ft3);
         ft3.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御暴击闪避") + "</font>";
         ft4 = new FTextArea();
         ft4.multiline = true;
         ft4.filters = StaticValue.filter;
         ft4.width = 60;
         ft4.height = 20;
         ft4.x = 125 + 58;
         ft4.y = 330 - 7;
         addChild(ft4);
         ft4.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("羽翼技能") + "</font>";
         i = 0;
         while(i < 3)
         {
            this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
            addChild(this.barBg1);
            this.barBg1.x = 50;
            this.barBg1.y = 238 + i * 16 + 25;
            i++;
         }
         i = 0;
         while(i < 3)
         {
            this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
            addChild(this.barBg1);
            this.barBg1.x = 50 + 185;
            this.barBg1.y = 238 + i * 16 + 25;
            i++;
         }
         this.barBar1 = new ColorBar(5,123,5);
         addChild(this.barBar1);
         this.barBar1.x = 50 + 4;
         this.barBar1.y = 238 + 3 + 25;
         this.barBar2 = new ColorBar(5,123,5);
         addChild(this.barBar2);
         this.barBar2.x = 50 + 4;
         this.barBar2.y = 238 + 3 + 16 + 25;
         this.barBar3 = new ColorBar(5,123,5);
         addChild(this.barBar3);
         this.barBar3.x = 50 + 4;
         this.barBar3.y = 238 + 3 + 32 + 25;
         this.barBar4 = new ColorBar(5,123,5);
         addChild(this.barBar4);
         this.barBar4.x = 50 + 4 + 185;
         this.barBar4.y = 238 + 3 + 25;
         this.barBar5 = new ColorBar(5,123,5);
         addChild(this.barBar5);
         this.barBar5.x = 50 + 4 + 185;
         this.barBar5.y = 238 + 3 + 16 + 25;
         this.barBar6 = new ColorBar(5,123,5);
         addChild(this.barBar6);
         this.barBar6.x = 50 + 4 + 185;
         this.barBar6.y = 238 + 3 + 32 + 25;
         i = 0;
         while(i < 2)
         {
            this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.kuang.x = 25 + 45 * i + 180 + 33;
            this.kuang.y = 310 + 4;
            addChild(this.kuang);
            i++;
         }
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 25 + 2 + 180 + 33;
         this.jinengSpr.y = 310 + 2 + 4;
         addChild(this.jinengSpr);
         this.emozhiyiTupo = new EMoZhiYiTupoCanvas();
         addChild(this.emozhiyiTupo);
         this.emozhiyiTupo.x = 138;
         this.emozhiyiTupo.y = -10;
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
         this.emozhiyiTupo.mask = $mask;
         this.fts = new FTextArea();
         this.fts.x = 15 + 60;
         this.fts.y = 240 - 25 + 25 + 3;
         this.fts.textColor = StaticValue.GREEN;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("恶魔羽翼顶级属性(已激活)");
         this.fts.visible = false;
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击10000000 防御10000000 血量12888888 青龙战纹20%") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 15 + 60 + 150;
         this.fts1.y = 240 - 25 + 25 + 3;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("恶魔羽翼顶级激活(已激活)");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击388888888防御88888888血量1088888888暴击 8888闪避8888 所有武功提升88层") + "<br>" + LanResManager.getLanCommonTextWords("恶魔法则（特殊技能）：每攻击至第8次必定触发该技能，产生恶魔领域结界，命中对手后对手") + "<br>" + LanResManager.getLanCommonTextWords("在该领域状态下血量最多不超过自身总血量的30%，并失去所有防御属性和玄武战纹属性，恶魔") + "<br>" + LanResManager.getLanCommonTextWords("法则状态将持续60秒或死亡方可解除") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("万恶无极技能书(已激活)");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击588888888 防御488888888 暴击888 闪避888 血量1088888888、所有武功提升588层") + "<br>" + LanResManager.getLanCommonTextWords("恶魔嗜血：攻击时有几率命中对手恶魔嗜血技能，命中恶魔嗜血技能的玩家每秒都将以总血量2%的速度受到伤害。") + "<br>" + LanResManager.getLanCommonTextWords("此技能效果持续60秒。当恶魔之翼等级达到最高级（8阶）时，技能触发技能将大幅度提升（翻倍）。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 150;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("恶魔之翼觉醒秘籍(已激活)");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("双击使用后，可激活恶魔之翼的觉醒属性，每次可使用恶魔觉醒之翼碎片×1进行加成，每次增加20亿攻击，武功2000层，每把上限500次。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("个恶魔觉醒之翼碎片");
            return _loc1_ + "</font></textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 150;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("暗黑圣光心法属性(已激活)");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("暗黑圣光心法：攻击8888888888900 防御5888888888900 血量9888888888900暴击 88888闪避88888   所有武功1500000层") + "<br>" + LanResManager.getLanCommonTextWords("★  暗黑圣光 ——  激活暗黑圣光心法的玩家，攻击时将100%给对手施加暗黑圣光状态，使对手在10秒内无法触发无敌效果，") + "<br>" + LanResManager.getLanCommonTextWords("且对手每次攻击都有50%的几率，自身无法发出任何技能，持续5秒。暗黑圣光效果持续10秒，冷却时间30秒！");
            return _loc1_ + "</font></textformat>";
         });
         addEventListener(UI_EMOZHIYI_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 240;
         this.fts5.y = 7;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 150;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("恶魔之心秘籍(已激活)");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("恶魔之心秘籍：攻击12888888889000 防御10888888889000 血量13888888889000 暴击 88888闪避  ") + "<br>" + LanResManager.getLanCommonTextWords("88888   所有武功2500000层  ") + "<br>" + LanResManager.getLanCommonTextWords("★恶魔之心 ——激活恶魔之心秘籍且养成满后，可激活恶魔之附体效果，100%抵抗送你千里之外。") + "<br>" + LanResManager.getLanCommonTextWords("★恶魔之心属性：激活恶魔之心秘籍后，将开启恶魔之心隐藏属性，可使用死亡碎魂对该隐藏属") + "<br>" + LanResManager.getLanCommonTextWords("性进行养成，最多可养成200次。每个增加：攻击1500亿，所有武功350000层。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + suihun + LanResManager.getLanCommonTextWords("颗死亡碎魂") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + suihun * 1500 + LanResManager.getLanCommonTextWords("亿，所有武功") + suihun * 350000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts6 = new FTextArea();
         this.fts6.x = 10 + 240;
         this.fts6.y = 7 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 150;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("分身护盾秘籍(已激活)");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("属性：攻击12888888889000 防御10888888889000 血量13888888889000 暴击 88888") + "<br>" + LanResManager.getLanCommonTextWords("闪避88888   所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("分身护盾 ——激活分身护盾秘籍且养成满后，可激活分身护盾效果，攻击时100%触") + "<br>" + LanResManager.getLanCommonTextWords("发分身护盾，持续15秒；在此状态下，每次被对手攻击时都将产生一个分身，自身将") + "<br>" + LanResManager.getLanCommonTextWords("清除所有负面BUFF， 且进入隐身状态，冷却60秒。") + "<br>" + LanResManager.getLanCommonTextWords("已使用分身术残卷") + canjuan + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + canjuan * 1500 + LanResManager.getLanCommonTextWords("亿，所有武功") + canjuan * 350000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.feixingBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_EMOZHIYI_FEIXING_CLICK));
               break;
            case this.hechengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_EMOZHIYI_HECHENG_SHOW));
               break;
            case this.jinjieBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_EMOZHIYI_LINGWU_SHOW,"",this.lookingId));
         }
         switch(param1.currentTarget)
         {
            case this.check:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_EMOZHIYI_WAIGUAN_CLICK,"",this.check.selectState));
         }
      }
      
      private function onClick2(param1:MouseEvent) : void
      {
         if(!this.isMainChar)
         {
            return;
         }
         if(this.lookingId == int(param1.target.name))
         {
            return;
         }
         this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_EMOZHIYI_HUANYE_CLICK,"",int(param1.target.name)));
         this.showTuPoPanel(false);
      }
      
      private function onFt2Tip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.laiyuan.addEventListener(MouseEvent.MOUSE_MOVE,this.onFt2Tip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("羽灵共有八种，由低到高为：恶魔羽灵一阶，恶魔羽灵二阶，恶魔羽灵三阶，恶魔羽灵四阶，恶魔羽灵五阶，恶魔羽灵六阶，恶魔羽灵七阶以及恶魔羽灵八阶。") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家可以从野外掉落或商城购买来获得恶魔羽灵一阶，然后通过羽灵合成功能合成恶魔羽灵二阶，以此类推最终合成至恶魔羽灵八阶。") + "<br></font>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("各阶羽灵对应羽翼的各个阶段使用增加羽翼属性。") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("此外，参加心魔活动击杀心魔可获得大量的恶魔羽灵一阶！") + "</font>" + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.laiyuan.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFt2Tip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      private function onFeixingTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.feixingBtn.addEventListener(MouseEvent.MOUSE_MOVE,this.onFeixingTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("展翅凌空将在恶魔之翼升至八阶时可使用，使用本功能后玩家将进入飞行状态，") + "<br>" + LanResManager.getLanCommonTextWords("飞行时玩家的闪避将大幅提升！飞行时将消耗一定的体力值。") + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.feixingBtn.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFeixingTip);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.emozhiyiTupo._parent2 = param1;
         this.emozhiyiTupo._parent3 = this;
      }
      
      public function setWupin(param1:String) : void
      {
         this.shiyong.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("双击使用") + param1 + LanResManager.getLanCommonTextWords("增加羽翼属性") + "</font>";
      }
      
      public function showEMoZhiYi(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      public function setInitialize(param1:EMoZhiYiVo, param2:Boolean) : void
      {
         this.isMainChar = param2;
         this.setWupin(param1.goodsName);
         this.setBg(param1.lookId);
         this.yuyidengji(param1.nowId,param1.lookId);
         this.setShuxingJiacheng(param1.shengMing,param1.maxShengMing,param1.tiLi,param1.maxTiLi,param1.gongJi,param1.maxGongJi,param1.fangYu,param1.maxFangYu,param1.baoJi,param1.maxBaoJi,param1.shanBi,param1.maxShanBi);
         var _loc3_:Object = param1.nameArr[param1.lookId];
         this.setZhenFaTiSheng(param1.lookId,param1.nowId);
         this.setSkill(param1.skillId,param1.isLearned,param1.skillId2,param1.isLearned2);
         this.showEMoZhiYi(param1.isShow);
         if(param1.nowId == 8 && this.isMainChar)
         {
            this.feixingBtn.filters = [];
            this.feixingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
         else
         {
            this.feixingBtn.filters = Tools.blackWhiteFilter;
            if(this.feixingBtn.hasEventListener(MouseEvent.CLICK))
            {
               this.feixingBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
            }
         }
         this.setJiHuo(param2);
      }
      
      public function setShuxingJiacheng(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int) : void
      {
         this.barBar1.setValue(param1 > param2 ? param2 : param1,param2);
         this.barBar2.setValue(param3 > param4 ? param4 : param3,param4);
         this.barBar3.setValue(param5 > param6 ? param6 : param5,param6);
         this.barBar4.setValue(param7 > param8 ? param8 : param7,param8);
         this.barBar5.setValue(param9 > param10 ? param10 : param9,param10);
         this.barBar6.setValue(param11 > param12 ? param12 : param11,param12);
         if(param1 >= param2)
         {
            this.jinjieBo = true;
         }
         else
         {
            this.jinjieBo = false;
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var lookid:int = param1;
         mcId = 0;
         if(lookid == 8)
         {
            mcId = 2;
         }
         else
         {
            mcId = 1;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/emozhiyi/" + mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[mcId] != null)
         {
            this.bloodMc = this.mcObj[mcId];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      private function yuyidengji(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < 8)
         {
            if(this["boll" + String(_loc3_ + 1)])
            {
               if(this["boll" + String(_loc3_ + 1)].parent)
               {
                  this["boll" + String(_loc3_ + 1)].parent.removeChild(this["boll" + String(_loc3_ + 1)]);
               }
            }
            this["boll" + String(_loc3_ + 1)] = null;
            if(_loc3_ < param1)
            {
               if(_loc3_ == param2 - 1)
               {
                  this["boll" + String(_loc3_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/emozhiyi/liangxuanzhong.swf");
               }
               else
               {
                  this["boll" + String(_loc3_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/emozhiyi/liang.swf");
               }
               this["TCball" + String(_loc3_ + 1)].visible = true;
               this["TCball" + String(_loc3_ + 1)].play();
            }
            else
            {
               if(_loc3_ == param2 - 1)
               {
                  this["boll" + String(_loc3_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/emozhiyi/anxuanzhong.swf");
               }
               else
               {
                  this["boll" + String(_loc3_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/emozhiyi/an.swf");
               }
               this["TCball" + String(_loc3_ + 1)].visible = false;
               this["TCball" + String(_loc3_ + 1)].stop();
            }
            this["bg" + String(_loc3_ + 1) + "Spr"].addChild(this["boll" + String(_loc3_ + 1)]);
            this["boll" + String(_loc3_ + 1)].visible = true;
            this["boll" + String(_loc3_ + 1)].name = String(_loc3_ + 1);
            this["boll" + String(_loc3_ + 1)].addEventListener(MouseEvent.CLICK,this.onClick2);
            _loc3_++;
         }
      }
      
      public function setZhenFaTiSheng(param1:int, param2:int = -1) : void
      {
         this.nowId = param2;
         this.lookingId = param1;
         if(this.tupoBo)
         {
            this.jinjieBtn.label = LanResManager.getLanCommonTextWords("羽翼进阶");
            this.jinjieBtn.enabled = false;
            this.closejinjie();
            this.hechengBtn.enabled = false;
         }
         else if(param1 < param2)
         {
            this.jinjieBtn.label = LanResManager.getLanCommonTextWords("已进阶");
            this.jinjieBtn.enabled = false;
            this.closejinjie();
         }
         else if(param1 == param2)
         {
            if(param2 == 8)
            {
               this.jinjieBtn.label = LanResManager.getLanCommonTextWords("已进阶");
               this.jinjieBo = false;
            }
            else
            {
               this.jinjieBtn.label = LanResManager.getLanCommonTextWords("羽翼进阶");
            }
            if(this.jinjieBo)
            {
               this.jinjieBtn.enabled = true;
               this.showjinjie();
            }
            else
            {
               this.jinjieBtn.enabled = false;
               this.closejinjie();
            }
         }
         else if(param1 > param2)
         {
            this.jinjieBtn.label = LanResManager.getLanCommonTextWords("不可进阶");
            this.jinjieBtn.enabled = false;
            this.closejinjie();
         }
      }
      
      public function setSkill(param1:int, param2:Boolean, param3:int, param4:Boolean) : void
      {
         var _loc5_:ItemFace = null;
         var _loc7_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc6_:Skill = new Skill(param1);
         _loc6_.isLearn = param2 == true ? 1 : 0;
         _loc5_ = new ItemFace(_loc6_);
         _loc5_.showKungFuTag();
         _loc5_.setShowCount(false);
         this.jinengSpr.addChild(_loc5_);
         var _loc8_:Skill = new Skill(param3);
         _loc8_.isLearn = param4 == true ? 1 : 0;
         _loc7_ = new ItemFace(_loc8_);
         _loc7_.showKungFuTag();
         _loc7_.setShowCount(false);
         _loc7_.x = 45;
         this.jinengSpr.addChild(_loc7_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.emozhiyiTupo.x == 138)
            {
               TweenMax.to(this.emozhiyiTupo,1,{"x":410});
               this.tupoBo = true;
               this.jinjieBtn.enabled = false;
               this.closejinjie();
               this.hechengBtn.enabled = false;
            }
         }
         else
         {
            if(this.emozhiyiTupo.x == 410)
            {
               TweenMax.to(this.emozhiyiTupo,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_EMOZHIYI_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.jinjieBtn.enabled = true;
            this.hechengBtn.enabled = true;
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.emozhiyiTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.emozhiyiTupo.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.emozhiyiTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.emozhiyiTupo.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.emozhiyiTupo.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.feixingBtn.enabled = false;
         this.hechengBtn.enabled = false;
         this.jinjieBtn.enabled = false;
         this.closejinjie();
         this.check.enabled = false;
      }
      
      public function showlihua() : void
      {
         if(this.lookingId == 7)
         {
            if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
            {
               this.yanhuaMc.parent.removeChild(this.yanhuaMc);
            }
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               yanhuaMc = _loc2_.content as MovieClip;
               yanhuaMc.x = 52 + 15 - 124;
               yanhuaMc.y = 60 - 182 - 6;
               addChild(yanhuaMc);
            },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/yuyi/shengji.swf");
         }
      }
      
      public function showjinjie() : void
      {
         if(Boolean(this.jinjieMc) && this.jinjieMc.parent != null)
         {
            this.jinjieMc.parent.removeChild(this.jinjieMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            jinjieMc = _loc2_.content as MovieClip;
            jinjieMc.x = 52 + 15 - 124 + 367 + 6 - 1;
            jinjieMc.y = 60 - 182 - 6 + 434 - 4 - 1;
            addChild(jinjieMc);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/yuyi/jinjie.swf");
      }
      
      public function closejinjie() : void
      {
         if(Boolean(this.jinjieMc) && this.jinjieMc.parent != null)
         {
            this.jinjieMc.parent.removeChild(this.jinjieMc);
         }
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.visible = GameState.dictMainStatus[SpecialGoodsID.EMOZHIYI_DINGJI_ID];
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.EMOZHIYI_DINGJIJIHUO_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.EMOZHIYI_WANEWUJI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.EMOZHIYI_JUEXINGMIJI_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.EMOZHIYI_JUEXINGSUIPIAN_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.EMOZHIYI_HEIANSHENGGUANG_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.EMOYUYI_EMOZHIXIN_ID];
            this.suihun = GameState.dictMainStatus[SpecialGoodsID.EMOYUYI_SIWANGSUIHUN_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.EMOZHIYI_FENSHENHUDUN_ID];
            this.canjuan = GameState.dictMainStatus[SpecialGoodsID.EMOZHIYI_FENSHENCANJUAN_ID];
         }
         else
         {
            this.fts.visible = GameState.dictTargetStatus[SpecialGoodsID.EMOZHIYI_DINGJI_ID];
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.EMOZHIYI_DINGJIJIHUO_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.EMOZHIYI_WANEWUJI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.EMOZHIYI_JUEXINGMIJI_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.EMOZHIYI_JUEXINGSUIPIAN_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.EMOZHIYI_HEIANSHENGGUANG_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.EMOYUYI_EMOZHIXIN_ID];
            this.suihun = GameState.dictTargetStatus[SpecialGoodsID.EMOYUYI_SIWANGSUIHUN_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.EMOZHIYI_FENSHENHUDUN_ID];
            this.canjuan = GameState.dictTargetStatus[SpecialGoodsID.EMOZHIYI_FENSHENCANJUAN_ID];
         }
      }
   }
}

