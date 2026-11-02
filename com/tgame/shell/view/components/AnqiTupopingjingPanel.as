package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.attribute.AnqiMubaPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class AnqiTupopingjingPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var fta:FTextArea;
      
      private var tf:TextFormat;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var fta6:FTextArea;
      
      private var xldjBar:ColorBar;
      
      private var cglBar:ColorBar;
      
      private var xyzBar:ColorBar;
      
      private var imgIco1:DisplayObject;
      
      private var imgIco2:DisplayObject;
      
      private var StartBtn:SecondButton;
      
      private var goumaiBtn:SecondButton;
      
      private var xyzInt:int;
      
      private var cglInt:int;
      
      private var ico1Str:String;
      
      private var ico2Str:String;
      
      private var ftat:FTextArea;
      
      private var MubaStartBtn:SecondButton;
      
      private var zdtpBtn:SecondButton;
      
      private var anqimubaPanel:AnqiMubaPanel;
      
      private var gongMc1:MovieClip;
      
      private var gongMc2:MovieClip;
      
      private var loadUrl:String;
      
      private var loadUr2:String;
      
      private var ftTime:FTextArea;
      
      public var rTime:int;
      
      public function AnqiTupopingjingPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var jiantou:Bitmap;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 450;
         height = 365;
         this.titleText = LanResManager.getLanCommonTextWords("突破瓶颈");
         this.isCloseEffect = false;
         bg = new Bitmap();
         bg.name = "ui.anqi.tupo.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = StaticValue.getBitmapByClassName("ui.anqi.kuang");
         bg.x = 14;
         bg.y = 7;
         addChild(bg);
         bg = StaticValue.getBitmapByClassName("ui.anqi.kuang");
         bg.x = 14;
         bg.y = 150;
         addChild(bg);
         jiantou = StaticValue.getBitmapByClassName("ui.anqi.arrow");
         addChild(jiantou);
         jiantou.x = 65;
         jiantou.y = 127;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 90;
            height = 20;
            x = 153;
            y = 15;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanTextWords(this,"暗器名称");
         }
         addChild(this.fta);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            width = 90;
            height = 20;
            x = 212 - 6;
            y = 13;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanCommonTextWords("金钱镖");
         }
         addChild(this.fta1);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            width = 65;
            height = 20;
            x = 301;
            y = 15;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanTextWords(this,"暗器品阶");
         }
         addChild(this.fta);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            width = 65;
            height = 20;
            x = 362;
            y = 13;
            textColor = StaticValue.WHITE;
            htmlText = "1" + LanResManager.getLanCommonTextWords("阶");
         }
         addChild(this.fta2);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 65;
            height = 20;
            x = 153;
            y = 37;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanTextWords(this,"暗器等级");
         }
         addChild(this.fta);
         this.xldjBar = new ColorBar(1,95,12,false);
         addChild(this.xldjBar);
         this.xldjBar.x = 230;
         this.xldjBar.y = 40;
         this.xldjBar.setValue(10,10);
         this.fta = new FTextArea();
         with(this.fta)
         {
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            width = 95;
            height = 20;
            x = 227;
            y = 37;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanCommonTextWords("已达瓶颈");
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            width = 290;
            height = 70;
            x = 153;
            y = 65;
            textColor = StaticValue.BLUE;
            htmlText = "<textformat leading=\'0\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"如果突破瓶颈失败") + "</font><br>" + "</textformat>";
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 153;
            y = 150;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,"本次突破需要消耗");
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 305;
            y = 150;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,"本次突破成功率");
         }
         addChild(this.fta);
         this.cglBar = new ColorBar(1,113,5,true,true);
         addChild(this.cglBar);
         this.cglBar.x = 311;
         this.cglBar.y = 174;
         this.cglBar.setValue(10,10);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 305;
            y = 198;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,"突破幸运值");
         }
         addChild(this.fta);
         this.xyzBar = new ColorBar(1,113,5);
         addChild(this.xyzBar);
         this.xyzBar.x = 311;
         this.xyzBar.y = 222;
         this.xyzBar.setValue(10,10);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 153;
            y = 167;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"铜币") + "</textformat>";
         }
         addChild(this.fta);
         this.fta4 = new FTextArea();
         with(this.fta4)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 195;
            y = 167;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta4);
         this.ftat = new FTextArea();
         with(this.ftat)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 153;
            y = 215;
            textColor = StaticValue.YELLOW;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"可以使用1个神奇木耙代替") + "</textformat>";
         }
         this.ftat.visible = false;
         addChild(this.ftat);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 170;
            height = 20;
            x = 153;
            y = 242;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanTextWords(this,"突破瓶颈后");
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 170;
            height = 20;
            x = 153;
            y = 264;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanTextWords(this,"暗器名称");
         }
         addChild(this.fta);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            width = 90;
            height = 20;
            x = 207;
            y = 262;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanCommonTextWords("金钱镖");
         }
         addChild(this.fta5);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 170;
            height = 20;
            x = 301;
            y = 264;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanTextWords(this,"暗器品阶");
         }
         addChild(this.fta);
         this.fta6 = new FTextArea();
         with(this.fta6)
         {
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            width = 61;
            height = 20;
            x = 350;
            y = 262;
            textColor = StaticValue.WHITE;
            htmlText = "99" + LanResManager.getLanCommonTextWords("阶");
         }
         addChild(this.fta6);
         this.goumaiBtn = new SecondButton();
         this.goumaiBtn.label = LanResManager.getLanCommonTextWords("购买升阶物品");
         addChild(this.goumaiBtn);
         this.goumaiBtn.x = 10;
         this.goumaiBtn.y = 298;
         this.goumaiBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.goumaiBtn.visible = false;
         this.StartBtn = new SecondButton();
         this.StartBtn.label = LanResManager.getLanCommonTextWords("开始突破");
         addChild(this.StartBtn);
         this.StartBtn.x = 130;
         this.StartBtn.y = 298;
         this.StartBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.zdtpBtn = new SecondButton();
         this.zdtpBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         addChild(this.zdtpBtn);
         this.zdtpBtn.x = 225;
         this.zdtpBtn.y = 298;
         this.zdtpBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.MubaStartBtn = new SecondButton();
         this.MubaStartBtn.label = LanResManager.getLanTextWords(this,"使用神奇木耙突破");
         addChild(this.MubaStartBtn);
         this.MubaStartBtn.x = 320;
         this.MubaStartBtn.y = 298;
         this.MubaStartBtn.visible = false;
         this.MubaStartBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.ftTime = new FTextArea();
         with(this.ftTime)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 153;
            y = 95;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ftTime);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         var _loc2_:AnqiTupopingjingTishiPanel = null;
         if(this.xyzInt > 0)
         {
            _loc2_ = new AnqiTupopingjingTishiPanel();
            _loc2_.$parent = this.$parent;
            _loc2_.setInitialize(this.xyzInt,this.cglInt);
            this.$parent.addEventListener(CharAttribute.UI_ANQITUPOPINGJINGTISHI_GUANBITUPO_CLICK,this.onTishiClose);
            POPWindowManager.showWindow(_loc2_);
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQITUPOPINGJINGTISHI_GUANBITUPO_CLICK));
            if(Boolean(this.gongMc1) && this.gongMc1.parent != null)
            {
               this.gongMc1.stop();
               this.gongMc1.parent.removeChild(this.gongMc1);
            }
            if(Boolean(this.gongMc2) && this.gongMc2.parent != null)
            {
               this.gongMc2.stop();
               this.gongMc2.parent.removeChild(this.gongMc2);
            }
            if(parent != null)
            {
               parent.removeChild(this);
            }
         }
      }
      
      private function onTishiClose(param1:BaseEvent) : void
      {
         if(Boolean(this.gongMc1) && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
         if(Boolean(this.gongMc2) && this.gongMc2.parent != null)
         {
            this.gongMc2.stop();
            this.gongMc2.parent.removeChild(this.gongMc2);
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function onTishiCloseFun() : void
      {
         if(Boolean(this.gongMc1) && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
         if(Boolean(this.gongMc2) && this.gongMc2.parent != null)
         {
            this.gongMc2.stop();
            this.gongMc2.parent.removeChild(this.gongMc2);
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.goumaiBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQITUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK));
               break;
            case this.StartBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQITUPOPINGJING_KAISHITUPO_CLICK));
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQIJINJIE_ZIDONGJINJIE_CLICK,"",false));
               break;
            case this.zdtpBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQIJINJIE_ZIDONGJINJIE_CLICK));
               break;
            case this.MubaStartBtn:
               if(!this.anqimubaPanel)
               {
                  this.anqimubaPanel = new AnqiMubaPanel();
                  this.anqimubaPanel.$parent = this.$parent;
               }
               this.anqimubaPanel.visible = true;
               addChild(this.anqimubaPanel);
               this.anqimubaPanel.x = 450;
               this.anqimubaPanel.y = -25;
         }
      }
      
      public function setInitialize(param1:Array) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         this.fta1.htmlText = param1[0];
         this.fta2.htmlText = param1[1];
         this.xldjBar.setValue(param1[2],param1[3]);
         if(param1[15])
         {
            _loc2_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1[4] + "</font>";
         }
         else
         {
            _loc2_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1[4] + "</font>";
         }
         if(param1[16])
         {
            _loc3_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1[5] + "</font>";
         }
         else
         {
            _loc3_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1[5] + "</font>";
         }
         if(param1[17])
         {
            _loc4_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1[6] + "</font>";
         }
         else
         {
            _loc4_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1[6] + "</font>";
         }
         this.fta4.htmlText = "<textformat leading=\'4\'>" + _loc2_ + "<br>" + _loc3_ + "<br>" + _loc4_ + "<br>" + "</textformat>";
         this.cglBar.setValue(param1[7],param1[8]);
         if(param1[9] > param1[10])
         {
            this.xyzBar.setValue(param1[10],param1[10]);
         }
         else
         {
            this.xyzBar.setValue(param1[9],param1[10]);
         }
         this.fta5.htmlText = param1[11];
         this.fta6.htmlText = param1[12];
         this.xyzInt = param1[9];
         this.cglInt = param1[7];
         if(this.gongMc1 != null && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
         if(this.gongMc2 != null && this.gongMc2.parent != null)
         {
            this.gongMc2.stop();
            this.gongMc2.parent.removeChild(this.gongMc2);
         }
         var _loc5_:Array = [];
         if(this.loadUrl == GameConfig.fileBaseFolder + "res/data/mc/anqi/" + param1[1] + ".swf" && Boolean(this.gongMc1))
         {
            this.gongMc1.x = 17;
            this.gongMc1.y = 13;
            addChildAt(this.gongMc1,1);
            this.gongMc1.play();
         }
         else
         {
            this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/anqi/" + param1[1] + ".swf";
            _loc5_.push(new LoadData(this.loadUrl,this.com,null,null,"","gongMc1"));
         }
         if(this.loadUr2 == GameConfig.fileBaseFolder + "res/data/mc/anqi/" + param1[12] + ".swf" && Boolean(this.gongMc2))
         {
            this.gongMc2.x = 17;
            this.gongMc2.y = 156;
            addChildAt(this.gongMc2,1);
            this.gongMc2.play();
         }
         else
         {
            this.loadUr2 = GameConfig.fileBaseFolder + "res/data/mc/anqi/" + param1[12] + ".swf";
            _loc5_.push(new LoadData(this.loadUr2,this.com,null,null,"","gongMc2"));
         }
         if(_loc5_.length != 0)
         {
            LoaderManager.load(_loc5_);
         }
      }
      
      private function com(param1:Event) : void
      {
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         var _loc3_:String = _loc2_._id;
         if(_loc3_ == "gongMc1")
         {
            if(_loc2_.url.url != this.loadUrl)
            {
               return;
            }
            if(this.gongMc1 != null && this.gongMc1.parent != null)
            {
               this.gongMc1.stop();
               this.gongMc1.parent.removeChild(this.gongMc1);
            }
            this.gongMc1 = _loc2_.content as MovieClip;
            if(this.gongMc1)
            {
               this.gongMc1.x = 17;
               this.gongMc1.y = 13;
               addChildAt(this.gongMc1,1);
               this.gongMc1.play();
            }
         }
         else if(_loc3_ == "gongMc2")
         {
            if(_loc2_.url.url != this.loadUr2)
            {
               return;
            }
            if(this.gongMc2 != null && this.gongMc2.parent != null)
            {
               this.gongMc2.stop();
               this.gongMc2.parent.removeChild(this.gongMc2);
            }
            this.gongMc2 = _loc2_.content as MovieClip;
            if(this.gongMc2)
            {
               this.gongMc2.x = 17;
               this.gongMc2.y = 156;
               addChildAt(this.gongMc2,1);
               this.gongMc2.play();
            }
         }
      }
      
      public function showMubaBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.MubaStartBtn.visible = true;
            this.ftat.visible = true;
            this.StartBtn.x = 130;
            this.StartBtn.y = 298;
            this.MubaStartBtn.x = 320;
            this.MubaStartBtn.y = 298;
         }
         else
         {
            this.StartBtn.x = 130;
            this.StartBtn.y = 298;
            this.MubaStartBtn.visible = false;
            this.ftat.visible = false;
         }
      }
      
      public function onCloseMuba() : void
      {
         this.anqimubaPanel.onClose();
      }
      
      public function setZdtsBtnLabel(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdtpBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         }
         else
         {
            this.zdtpBtn.label = LanResManager.getLanCommonTextWords("停止突破");
         }
      }
      
      public function setRTime(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         this.rTime = param1;
         if(this.rTime == 0)
         {
            this.ftTime.htmlText = "";
         }
         else
         {
            _loc2_ = LanResManager.getLanCommonTextWords("祝福值清空倒计时：");
            _loc3_ = LanResManager.getLanCommonTextWords("时");
            _loc4_ = LanResManager.getLanCommonTextWords("分");
            this.ftTime.htmlText = "";
         }
      }
   }
}

