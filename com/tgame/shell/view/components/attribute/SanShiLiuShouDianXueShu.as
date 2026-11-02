package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
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
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import gs.TweenMax;
   
   public class SanShiLiuShouDianXueShu extends Sprite
   {
      
      public static const UI_SANSHILIUSHOUDIANXUESHU_GUANBI_CLICK:String = "UI_SANSHILIUSHOUDIANXUESHU_GUANBI_CLICK";
      
      public const SANSHILIUSHOU_MAX:int = 36;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var _$parent:DisplayObject;
      
      private var diyiceng:FTextArea;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var lingwubutton:SecondButton;
      
      private var kuang:Bitmap;
      
      private var jineng:ItemFace;
      
      private var jinengchufa:SecondButton;
      
      private var yeshu:int = 1;
      
      private var sanshiliushoudianxueshu:SanShiLiuShouDianXueShuTupoCanvas;
      
      private var bb:int = 0;
      
      private var tupoBo:Boolean = false;
      
      private var jutishuxing:FTextArea;
      
      private var isDoubleFT:FTextArea;
      
      private var neirong:FTextArea;
      
      private var btn1:SimpleButton;
      
      private var btn2:SimpleButton;
      
      private var btn3:SimpleButton;
      
      private var btn4:SimpleButton;
      
      private var btn5:SimpleButton;
      
      private var btn6:SimpleButton;
      
      private var btn7:SimpleButton;
      
      private var btn8:SimpleButton;
      
      private var btn9:SimpleButton;
      
      private var btn10:SimpleButton;
      
      private var btn11:SimpleButton;
      
      private var btn12:SimpleButton;
      
      private var jinengSpr:Sprite;
      
      private var $class:Class;
      
      private var bg1:DisplayObject;
      
      private var bg2:DisplayObject;
      
      private var bg3:DisplayObject;
      
      private var bgR1:DisplayObject;
      
      private var bgR2:DisplayObject;
      
      private var bgR3:DisplayObject;
      
      private var ballArr:Array;
      
      private var ball0:MovieClip;
      
      private var ball1:MovieClip;
      
      private var ball2:MovieClip;
      
      private var ball3:MovieClip;
      
      private var ball4:MovieClip;
      
      private var ball5:MovieClip;
      
      private var ball6:MovieClip;
      
      private var ball7:MovieClip;
      
      private var ball8:MovieClip;
      
      private var ball9:MovieClip;
      
      private var ball10:MovieClip;
      
      private var ball11:MovieClip;
      
      private var bgSpr:Sprite;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      private var fts3:FTextArea;
      
      public function SanShiLiuShouDianXueShu()
      {
         var BiaoTi:FTextArea;
         var shuxingjiacheng:FTextArea;
         var fudaijineng:FTextArea;
         var $mask:Sprite;
         var box:FCanvas = null;
         var loadUrl:String = null;
         super();
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/sanshiliushou/diban1.swf");
         this.bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/sanshiliushou/diban3.swf");
         this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/sanshiliushou/diban5.swf");
         this.bgR1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/sanshiliushou/diban2.swf");
         this.bgR2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/sanshiliushou/diban4.swf");
         this.bgR3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/sanshiliushou/diban6.swf");
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 202;
         box.y = 231 + 2;
         box.width = 198 + 2;
         box.height = 135;
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 180 - 50 + 20;
         this.shangyiyeButton.y = 208 + 1;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.diyiceng = new FTextArea();
         this.diyiceng.autoSize;
         addChild(this.diyiceng);
         this.diyiceng.multiline = true;
         this.diyiceng.autoSize = TextFieldAutoSize.LEFT;
         this.diyiceng.wordWrap = true;
         this.diyiceng.width = 150;
         this.diyiceng.height = 30;
         this.diyiceng.x = 180;
         this.diyiceng.y = 220 - 5 - 15 + 10;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 208 + 1;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingwubutton = new SecondButton();
         addChild(this.lingwubutton);
         this.lingwubutton.x = 240 + 50;
         this.lingwubutton.y = 208;
         this.lingwubutton.label = LanResManager.getLanCommonTextWords("领悟本式");
         this.lingwubutton.addEventListener(MouseEvent.CLICK,this.onClick);
         BiaoTi = new FTextArea();
         addChild(BiaoTi);
         BiaoTi.multiline = true;
         BiaoTi.autoSize = TextFieldAutoSize.LEFT;
         BiaoTi.wordWrap = true;
         BiaoTi.width = 150;
         BiaoTi.height = 30;
         BiaoTi.x = 25 + 30 - 25;
         BiaoTi.y = 253 + 4 - 30 + 10 + 3;
         BiaoTi.htmlText = "<font size=\'15\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("擒拿点穴术") + "</font>";
         this.neirong = new FTextArea();
         addChild(this.neirong);
         this.neirong.multiline = true;
         this.neirong.autoSize = TextFieldAutoSize.LEFT;
         this.neirong.wordWrap = true;
         this.neirong.width = 180;
         this.neirong.height = 120;
         this.neirong.x = 25 - 8;
         this.neirong.y = 253 + 4 + 10;
         shuxingjiacheng = new FTextArea();
         addChild(shuxingjiacheng);
         shuxingjiacheng.multiline = true;
         shuxingjiacheng.autoSize = TextFieldAutoSize.LEFT;
         shuxingjiacheng.wordWrap = true;
         shuxingjiacheng.width = 100;
         shuxingjiacheng.height = 30;
         shuxingjiacheng.x = 213;
         shuxingjiacheng.y = 245;
         shuxingjiacheng.htmlText = "<font size=\'15\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("属性加成：") + "</font>";
         this.jutishuxing = new FTextArea();
         addChild(this.jutishuxing);
         this.jutishuxing.multiline = true;
         this.jutishuxing.autoSize = TextFieldAutoSize.LEFT;
         this.jutishuxing.wordWrap = true;
         this.jutishuxing.width = 180;
         this.jutishuxing.height = 120;
         this.jutishuxing.x = 213 + 10;
         this.jutishuxing.y = 245 + 25;
         this.jutishuxing.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击防御生命内力体力") + "</font></textformat>";
         this.isDoubleFT = new FTextArea();
         addChild(this.isDoubleFT);
         this.isDoubleFT.multiline = true;
         this.isDoubleFT.autoSize = TextFieldAutoSize.LEFT;
         this.isDoubleFT.wordWrap = true;
         this.isDoubleFT.width = 180;
         this.isDoubleFT.height = 120;
         this.isDoubleFT.x = 300;
         this.isDoubleFT.y = 245 + 25;
         this.isDoubleFT.visible = false;
         this.isDoubleFT.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>*2<br>*2<br>*2<br>*2<br>*2</font></textformat>";
         fudaijineng = new FTextArea();
         addChild(fudaijineng);
         fudaijineng.multiline = true;
         fudaijineng.autoSize = TextFieldAutoSize.LEFT;
         fudaijineng.wordWrap = true;
         fudaijineng.width = 100;
         fudaijineng.height = 30;
         fudaijineng.x = 213 + 90;
         fudaijineng.y = 245;
         fudaijineng.htmlText = "<font size=\'15\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("附带技能：") + "</font>";
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 303 + 20;
         this.kuang.y = 230 + 60;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 303 + 20 + 1 + 1;
         this.jinengSpr.y = 292;
         addChild(this.jinengSpr);
         this.sanshiliushoudianxueshu = new SanShiLiuShouDianXueShuTupoCanvas();
         addChild(this.sanshiliushoudianxueshu);
         this.sanshiliushoudianxueshu.x = 138;
         this.sanshiliushoudianxueshu.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -5;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.sanshiliushoudianxueshu.mask = $mask;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/sanshiliushou/xueweidian.swf";
         this.ball0 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball0 = _loc2_.content as MovieClip;
            if(ball0)
            {
               ball0.visible = false;
               ball0.stop();
               addChild(ball0);
            }
         },null,false,loadUrl);
         this.ball1 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball1 = _loc2_.content as MovieClip;
            if(ball1)
            {
               ball1.visible = false;
               ball1.stop();
               addChild(ball1);
            }
         },null,false,loadUrl);
         this.ball2 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball2 = _loc2_.content as MovieClip;
            if(ball2)
            {
               ball2.visible = false;
               ball2.stop();
               addChild(ball2);
            }
         },null,false,loadUrl);
         this.ball3 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball3 = _loc2_.content as MovieClip;
            if(ball3)
            {
               ball3.visible = false;
               ball3.stop();
               addChild(ball3);
            }
         },null,false,loadUrl);
         this.ball4 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball4 = _loc2_.content as MovieClip;
            if(ball4)
            {
               ball4.visible = false;
               ball4.stop();
               addChild(ball4);
            }
         },null,false,loadUrl);
         this.ball5 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball5 = _loc2_.content as MovieClip;
            if(ball5)
            {
               ball5.visible = false;
               ball5.stop();
               addChild(ball5);
            }
         },null,false,loadUrl);
         this.ball6 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball6 = _loc2_.content as MovieClip;
            if(ball6)
            {
               ball6.visible = false;
               ball6.stop();
               addChild(ball6);
            }
         },null,false,loadUrl);
         this.ball7 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball7 = _loc2_.content as MovieClip;
            if(ball7)
            {
               ball7.visible = false;
               ball7.stop();
               addChild(ball7);
            }
         },null,false,loadUrl);
         this.ball8 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball8 = _loc2_.content as MovieClip;
            if(ball8)
            {
               ball8.visible = false;
               ball8.stop();
               addChild(ball8);
            }
         },null,false,loadUrl);
         this.ball9 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball9 = _loc2_.content as MovieClip;
            if(ball9)
            {
               ball9.visible = false;
               ball9.stop();
               addChild(ball9);
            }
         },null,false,loadUrl);
         this.ball10 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball10 = _loc2_.content as MovieClip;
            if(ball10)
            {
               ball10.visible = false;
               ball10.stop();
               addChild(ball10);
            }
         },null,false,loadUrl);
         this.ball11 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            ball11 = _loc2_.content as MovieClip;
            if(ball11)
            {
               ball11.visible = false;
               ball11.stop();
               addChild(ball11);
            }
         },null,false,loadUrl);
         this.fts = new FTextArea();
         this.fts.x = 20;
         this.fts.y = 20;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("擒拿点穴手顶级属性(未激活)");
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击4888888、防御 3888888、血量62888888 、暴击 2888、闪避2888、") + "<br>" + LanResManager.getLanCommonTextWords("所有武功提升十二层，100%抵抗擒拿点穴手技能。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 20;
         this.fts1.y = 20 + 20;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("三十六路擒拿护体功(已激活)");
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：4888亿、防御3888亿、血量8888亿、所有武功提升 80000层 ") + "<br>" + LanResManager.getLanCommonTextWords("擒拿护体（特殊技能）：每攻击三十六次必定触发，在此状态下100%不会受到定身效果影响，效果持续3秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 20 + 208;
         this.fts2.y = 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("降魔定禅决(已激活)");
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击1688888888888 防御1288888888888 血量2088888888888暴击 88888闪避88888   所有武功250000层") + "<br>" + LanResManager.getLanCommonTextWords("定禅决 —— 为佛门代代相传的特殊神技，在自身受到负面状态时可以使用，使用后立即清除自身所有负面状态，技能冷却时间30秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324;
         this.kuang1.y = 160 + 35 - 186;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         addEventListener(UI_SANSHILIUSHOUDIANXUESHU_GUANBI_CLICK,this.onCloseTupo);
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SANSHILIUSHOU_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SANSHILIUSHOU_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.lingwubutton:
               if(this.tupoBo)
               {
                  return;
               }
               if(this.sanshiliushoudianxueshu.x > 138)
               {
                  return;
               }
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SANSHILIUSHOU_TUPO_CLICK));
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.sanshiliushoudianxueshu._parent2 = param1;
         this.sanshiliushoudianxueshu._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:String, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean, param13:int, param14:Boolean) : void
      {
         this.setBg(param3);
         this.setBall(param3);
         this.setJieshao(param2);
         this.setShuxingJiacheng(param7,param8,param6,param9,param10,param13);
         this.setZhaoShiMsg(param4,param3,param5);
         this.setSkill(param11,param12);
         this.setDingJi(param14);
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.SANSHILIULUQINNASHOU_HUTISHENGONG_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.SANSHILIULUQINNASHOU_XIANGMODINGCHANJUE_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.SANSHILIULUQINNASHOU_XIANGMODINGCHANJUE_ID])
            {
               this.setSkillJiHuo(200210,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.SANSHILIULUQINNASHOU_HUTISHENGONG_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.SANSHILIULUQINNASHOU_XIANGMODINGCHANJUE_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.SANSHILIULUQINNASHOU_XIANGMODINGCHANJUE_ID])
            {
               this.setSkillJiHuo(200210,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
         }
      }
      
      public function setDingJi(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("擒拿点穴手顶级属性(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("擒拿点穴手顶级属性(未激活)");
         }
      }
      
      private function setBall(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < 12)
         {
            _loc3_ = param1 % 12;
            if(_loc3_ == 0)
            {
               _loc3_ = 12;
            }
            if(param1 < 13)
            {
               _loc4_ = 0;
            }
            else if(param1 < 25)
            {
               _loc4_ = 1;
            }
            else
            {
               _loc4_ = 2;
            }
            if(_loc2_ < _loc3_)
            {
               this["ball" + _loc2_].visible = true;
               if(_loc4_ == 0)
               {
                  switch(_loc2_)
                  {
                     case 0:
                        this["ball" + _loc2_].x = 118;
                        this["ball" + _loc2_].y = -15;
                        break;
                     case 1:
                        this["ball" + _loc2_].x = 117 + 173;
                        this["ball" + _loc2_].y = 20 * 1 - 36 + 19;
                        break;
                     case 2:
                        this["ball" + _loc2_].x = 117 - 55;
                        this["ball" + _loc2_].y = 20 * 1 - 36 + 37;
                        break;
                     case 3:
                        this["ball" + _loc2_].x = 117 + 211 + 1;
                        this["ball" + _loc2_].y = 20 * 1 - 36 + 51 - 1;
                        break;
                     case 4:
                        this["ball" + _loc2_].x = 117 - 31;
                        this["ball" + _loc2_].y = 20 * 1 - 36 + 73 - 1;
                        break;
                     case 5:
                        this["ball" + _loc2_].x = 273;
                        this["ball" + _loc2_].y = 65;
                        break;
                     case 6:
                        this["ball" + _loc2_].x = 117 - 61;
                        this["ball" + _loc2_].y = 20 * 1 - 36 + 88 + 19;
                        break;
                     case 7:
                        this["ball" + _loc2_].x = 117 + 139;
                        this["ball" + _loc2_].y = 20 * 1 - 36 + 109;
                        break;
                     case 8:
                        this["ball" + _loc2_].x = 117 - 78 - 1;
                        this["ball" + _loc2_].y = 20 * 1 - 36 + 130 + 1;
                        break;
                     case 9:
                        this["ball" + _loc2_].x = 117 + 161 - 1;
                        this["ball" + _loc2_].y = 20 * 1 - 36 + 123 + 2 + 1;
                        break;
                     case 10:
                        this["ball" + _loc2_].x = 117 - 70;
                        this["ball" + _loc2_].y = 20 * 1 - 36 + 161;
                        break;
                     case 11:
                        this["ball" + _loc2_].x = 117 + 175 - 1;
                        this["ball" + _loc2_].y = 20 * 1 - 36 + 161;
                  }
               }
               else if(_loc4_ == 1)
               {
                  switch(_loc2_)
                  {
                     case 0:
                        this["ball" + _loc2_].x = 118 + 20;
                        this["ball" + _loc2_].y = -15;
                        break;
                     case 1:
                        this["ball" + _loc2_].x = 118 + 20 + 129 + 1;
                        this["ball" + _loc2_].y = -15 + 20 - 2;
                        break;
                     case 2:
                        this["ball" + _loc2_].x = 118 + 20 - 18;
                        this["ball" + _loc2_].y = -15 + 30;
                        break;
                     case 3:
                        this["ball" + _loc2_].x = 118 + 20 + 153 + 1;
                        this["ball" + _loc2_].y = -15 + 48;
                        break;
                     case 4:
                        this["ball" + _loc2_].x = 118 + 20 - 52;
                        this["ball" + _loc2_].y = -15 + 73 - 1;
                        break;
                     case 5:
                        this["ball" + _loc2_].x = 118 + 20 + 134 + 1;
                        this["ball" + _loc2_].y = -15 + 80;
                        break;
                     case 6:
                        this["ball" + _loc2_].x = 118 + 20 - 50;
                        this["ball" + _loc2_].y = -15 + 107;
                        break;
                     case 7:
                        this["ball" + _loc2_].x = 118 + 20 + 163;
                        this["ball" + _loc2_].y = -15 + 97;
                        break;
                     case 8:
                        this["ball" + _loc2_].x = 118 + 20 - 99;
                        this["ball" + _loc2_].y = -15 + 131;
                        break;
                     case 9:
                        this["ball" + _loc2_].x = 118 + 20 + 161 + 1;
                        this["ball" + _loc2_].y = -15 + 126 + 1;
                        break;
                     case 10:
                        this["ball" + _loc2_].x = 118 + 20 - 91;
                        this["ball" + _loc2_].y = -15 + 161;
                        break;
                     case 11:
                        this["ball" + _loc2_].x = 118 + 20 + 151 + 1 + 1;
                        this["ball" + _loc2_].y = -15 + 156;
                  }
               }
               else if(_loc4_ == 2)
               {
                  switch(_loc2_)
                  {
                     case 0:
                        this["ball" + _loc2_].x = 126 - 1;
                        this["ball" + _loc2_].y = -15;
                        break;
                     case 1:
                        this["ball" + _loc2_].x = 126 + 121;
                        this["ball" + _loc2_].y = -15 + 18;
                        break;
                     case 2:
                        this["ball" + _loc2_].x = 126 - 28 - 2;
                        this["ball" + _loc2_].y = -15 + 30;
                        break;
                     case 3:
                        this["ball" + _loc2_].x = 126 + 172 - 1;
                        this["ball" + _loc2_].y = -15 + 37;
                        break;
                     case 4:
                        this["ball" + _loc2_].x = 126 - 7 - 2;
                        this["ball" + _loc2_].y = -15 + 62;
                        break;
                     case 5:
                        this["ball" + _loc2_].x = 126 + 153 - 1;
                        this["ball" + _loc2_].y = -15 + 76 - 1;
                        break;
                     case 6:
                        this["ball" + _loc2_].x = 126 - 31 - 2;
                        this["ball" + _loc2_].y = -15 + 91;
                        break;
                     case 7:
                        this["ball" + _loc2_].x = 126 + 127 - 1;
                        this["ball" + _loc2_].y = -15 + 94;
                        break;
                     case 8:
                        this["ball" + _loc2_].x = 126 - 84 - 2;
                        this["ball" + _loc2_].y = -15 + 131;
                        break;
                     case 9:
                        this["ball" + _loc2_].x = 126 + 153 - 1;
                        this["ball" + _loc2_].y = -15 + 125;
                        break;
                     case 10:
                        this["ball" + _loc2_].x = 126 - 66 - 2;
                        this["ball" + _loc2_].y = -15 + 171;
                        break;
                     case 11:
                        this["ball" + _loc2_].x = 126 + 211;
                        this["ball" + _loc2_].y = -15 + 159;
                  }
               }
            }
            else
            {
               this["ball" + _loc2_].visible = false;
            }
            _loc2_++;
         }
      }
      
      private function setBg(param1:int) : void
      {
         while(this.bgSpr.numChildren > 0)
         {
            this.bgSpr.removeChildAt(0);
         }
         if(param1 < 13)
         {
            if(param1 == 12)
            {
               this.bgSpr.addChild(this.bgR1);
            }
            else
            {
               this.bgSpr.addChild(this.bg1);
            }
         }
         else if(param1 < 25)
         {
            if(param1 == 24)
            {
               this.bgSpr.addChild(this.bgR2);
            }
            else
            {
               this.bgSpr.addChild(this.bg2);
            }
         }
         else if(param1 == 36)
         {
            this.bgSpr.addChild(this.bgR3);
         }
         else
         {
            this.bgSpr.addChild(this.bg3);
         }
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         var _loc4_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         _loc4_ = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         this.jinengSpr.addChild(_loc4_);
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.diyiceng.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.lingwubutton.label = LanResManager.getLanCommonTextWords("领悟本式");
            this.lingwubutton.enabled = false;
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            else
            {
               this.shangyiyeButton.enabled = true;
            }
            if(param2 >= this.SANSHILIUSHOU_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
            else
            {
               this.xiayiyeButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.lingwubutton.label = LanResManager.getLanCommonTextWords("已领悟");
               this.lingwubutton.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.lingwubutton.label = LanResManager.getLanCommonTextWords("领悟本式");
               this.lingwubutton.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.lingwubutton.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.lingwubutton.enabled = false;
            }
         }
      }
      
      public function setJieshao(param1:String) : void
      {
         this.neirong.htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + param1 + "</font>";
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.sanshiliushoudianxueshu.x == 138)
            {
               TweenMax.to(this.sanshiliushoudianxueshu,1,{"x":410});
               this.tupoBo = true;
               this.bb = 1;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.lingwubutton.enabled = false;
            }
         }
         else
         {
            if(this.sanshiliushoudianxueshu.x == 410)
            {
               TweenMax.to(this.sanshiliushoudianxueshu,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SANSHILIUSHOU_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.bb = 0;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.lingwubutton.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.SANSHILIUSHOU_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.sanshiliushoudianxueshu.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setShuxingJiacheng(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.jutishuxing.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + param1 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("内力:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("体力:") + param5 + "</font></textformat>";
         if(param6 == 0)
         {
            this.isDoubleFT.visible = false;
         }
         else
         {
            this.isDoubleFT.visible = true;
            this.isDoubleFT.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>×" + String(param6) + "<br>×" + String(param6) + "<br>×" + String(param6) + "<br>×" + String(param6) + "<br>×" + String(param6) + "</font></textformat>";
         }
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.sanshiliushoudianxueshu.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.sanshiliushoudianxueshu.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.sanshiliushoudianxueshu.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.sanshiliushoudianxueshu.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.lingwubutton.enabled = false;
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setSkillJiHuo(param1:int, param2:Boolean) : void
      {
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(this.mainSkillItemFace)
         {
            if(this.mainSkillItemFace.parent)
            {
               this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         this.mainSkill = _loc3_;
         if(param2)
         {
            this.mainSkill.isLearn = 1;
         }
         else
         {
            this.mainSkill.isLearn = 0;
         }
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
   }
}

