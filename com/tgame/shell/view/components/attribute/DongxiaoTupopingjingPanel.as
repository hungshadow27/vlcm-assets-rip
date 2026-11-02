package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class DongxiaoTupopingjingPanel extends FPanel
   {
      
      public static const UI_ANQITUPOPINGJINGTISHI_JIXUTUPO_CLICK:String = "UI_ANQITUPOPINGJINGTISHI_JIXUTUPO_CLICK";
      
      public var $parent:DisplayObject;
      
      private var fta:FTextArea;
      
      private var tf:TextFormat;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta4:FTextArea;
      
      private var goodsBox:Sprite;
      
      private var fta5:FTextArea;
      
      private var fta6:FTextArea;
      
      private var xldjBar:ColorBar;
      
      private var cglBar:ColorBar;
      
      private var xyzBar:ColorBar;
      
      private var imgIco1:DisplayObject;
      
      private var imgIco2:DisplayObject;
      
      private var StartBtn:SecondButton;
      
      private var ZidongBtn:SecondButton;
      
      private var goumaiBtn:SecondButton;
      
      private var xyzInt:int;
      
      private var cglInt:int;
      
      private var ico1Str:String;
      
      private var ico2Str:String;
      
      private var ftat:FTextArea;
      
      private var MubaStartBtn:SecondButton;
      
      private var anqimubaPanel:AnqiMubaPanel;
      
      private var gongMc1:MovieClip;
      
      private var gongMc2:MovieClip;
      
      private var loadUrl:String;
      
      private var loadUr2:String;
      
      private var useBLJH:FCheckBox;
      
      private var useBLJH2:FCheckBox;
      
      private var _goodsName:String;
      
      private var _count:int;
      
      private var _enough:Boolean;
      
      public function DongxiaoTupopingjingPanel()
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
         titleText = LanResManager.getLanTextWords(this,"突破瓶颈");
         this.isCloseEffect = false;
         bg = new Bitmap();
         bg.name = "ui.dongxiao.tupo.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = StaticValue.getBitmapByClassName("ui.dongxiao.kuang");
         bg.x = 11;
         bg.y = 3;
         addChild(bg);
         bg = StaticValue.getBitmapByClassName("ui.dongxiao.kuang");
         bg.x = 11;
         bg.y = 150 - 6;
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
            width = 65;
            height = 20;
            x = 153;
            y = 13;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanCommonTextWords("洞箫名称：");
         }
         addChild(this.fta);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            width = 65;
            height = 20;
            x = 214;
            y = 13;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            width = 65;
            height = 20;
            x = 293;
            y = 13;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanCommonTextWords("音箫段位：");
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
            htmlText = "";
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
            y = 35;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanCommonTextWords("修炼等级：");
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
            y = 36;
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
            width = 280;
            height = 70;
            x = 153;
            y = 63;
            textColor = StaticValue.BLUE;
            htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"突破失败时会增加下次突破成功的祝福几率1_2",[StaticValue.GREEN_HTML,xyzInt,StaticValue.RED_HTML]) + "</textformat>";
         }
         addChild(this.fta);
         this.useBLJH = new FCheckBox();
         this.useBLJH.textColor = StaticValue.YELLOW;
         this.useBLJH.text = LanResManager.getLanCommonTextWords("使用洞箫精华");
         this.useBLJH.x = 153;
         this.useBLJH.y = 150;
         this.useBLJH.visible = false;
         this.useBLJH.addEventListener(MouseEvent.CLICK,this.updateSuoxuCount);
         addChild(this.useBLJH);
         this.useBLJH2 = new FCheckBox();
         this.useBLJH2.textColor = StaticValue.YELLOW;
         this.useBLJH2.text = LanResManager.getLanCommonTextWords("使用神奇洞箫升段石");
         this.useBLJH2.x = 153;
         this.useBLJH2.y = 150 + 22;
         this.useBLJH2.visible = false;
         this.useBLJH2.addEventListener(MouseEvent.CLICK,this.updateSuoxuCount);
         addChild(this.useBLJH2);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 153;
            y = 150 + 22 + 22;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("本次突破需要消耗：");
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
            htmlText = LanResManager.getLanCommonTextWords("本次突破成功率：");
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
            htmlText = LanResManager.getLanCommonTextWords("突破祝福值：");
         }
         addChild(this.fta);
         this.xyzBar = new ColorBar(1,113,5);
         addChild(this.xyzBar);
         this.xyzBar.x = 311;
         this.xyzBar.y = 222;
         this.xyzBar.setValue(10,10);
         this.fta4 = new FTextArea();
         with(this.fta4)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 153;
            y = 150 + 22 + 22 + 22;
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
            htmlText = "";
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
            htmlText = LanResManager.getLanCommonTextWords("突破瓶颈后，您将可以修炼：");
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
            y = 262;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("洞箫名称：");
         }
         addChild(this.fta);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            width = 61;
            height = 20;
            x = 217;
            y = 262;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta5);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 170;
            height = 20;
            x = 288;
            y = 262;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("音箫段位：");
         }
         addChild(this.fta);
         this.fta6 = new FTextArea();
         with(this.fta6)
         {
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            width = 61;
            height = 20;
            x = 365;
            y = 262;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta6);
         this.goumaiBtn = new SecondButton();
         this.goumaiBtn.label = LanResManager.getLanCommonTextWords("购买升段物品");
         addChild(this.goumaiBtn);
         this.goumaiBtn.x = 50;
         this.goumaiBtn.y = 298;
         this.goumaiBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.goumaiBtn.visible = false;
         this.StartBtn = new SecondButton();
         this.StartBtn.label = LanResManager.getLanCommonTextWords("开始突破");
         addChild(this.StartBtn);
         this.StartBtn.x = this.goumaiBtn.x + this.goumaiBtn.width + 25;
         this.StartBtn.y = 298;
         this.StartBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.ZidongBtn = new SecondButton();
         this.ZidongBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         addChild(this.ZidongBtn);
         this.ZidongBtn.x = this.StartBtn.x + this.StartBtn.width + 25;
         this.ZidongBtn.y = 298;
         this.ZidongBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.MubaStartBtn = new SecondButton();
         this.MubaStartBtn.label = LanResManager.getLanTextWords(this,"使用神奇木耙突破");
         addChild(this.MubaStartBtn);
         this.MubaStartBtn.x = 290;
         this.MubaStartBtn.y = 298;
         this.MubaStartBtn.visible = false;
         this.MubaStartBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
      }
      
      public function get useDongxiaoGoodsType() : int
      {
         if(this.useBLJH.visible && this.useBLJH.selectState)
         {
            return 1;
         }
         if(this.useBLJH2.visible && this.useBLJH2.selectState)
         {
            return 2;
         }
         return 0;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         var str:String = null;
         var e:FCloseEvent = param1;
         if(this.xyzInt > 0)
         {
            str = "";
            str = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"您本次突破瓶颈积累了突破幸运值点下次突破瓶颈的成功率提高了请_1",[StaticValue.GREEN_HTML,this.xyzInt,StaticValue.RED_HTML]) + "</textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续提升");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  $parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAOTUPOPINGJING_CLOSE));
                  if(Boolean(gongMc1) && gongMc1.parent != null)
                  {
                     gongMc1.stop();
                     gongMc1.parent.removeChild(gongMc1);
                  }
                  if(Boolean(gongMc2) && gongMc2.parent != null)
                  {
                     gongMc2.stop();
                     gongMc2.parent.removeChild(gongMc2);
                  }
                  closeFun();
               }
            });
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAOTUPOPINGJING_CLOSE));
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
            this.closeFun();
         }
      }
      
      private function closeFun() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
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
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAOTUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK));
               break;
            case this.StartBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAOTUPOPINGJING_KAISHITUPO_CLICK,"",1));
               break;
            case this.ZidongBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAOTUPOPINGJING_KAISHITUPO_CLICK,"",2));
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
         this.fta1.htmlText = param1[0];
         this.fta2.htmlText = param1[1];
         this.xldjBar.setValue(param1[2],param1[3]);
         var _loc2_:Goods = param1[6];
         this._goodsName = _loc2_.res.name;
         this._count = _loc2_.count;
         this._enough = param1[17];
         this.updateSuoxuCount();
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
         this.fta6.htmlText = param1[1] + 1;
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
         var _loc3_:Array = [];
         if(this.loadUrl == GameConfig.fileBaseFolder + "res/data/mc/dongxiao/" + param1[1] + ".swf" && Boolean(this.gongMc1))
         {
            this.gongMc1.x = 12;
            this.gongMc1.y = 7;
            addChildAt(this.gongMc1,1);
            this.gongMc1.play();
         }
         else
         {
            this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/dongxiao/" + param1[1] + ".swf";
            _loc3_.push(new LoadData(this.loadUrl,this.com,null,null,"","gongMc1"));
         }
         if(this.loadUr2 == GameConfig.fileBaseFolder + "res/data/mc/dongxiao/" + (param1[1] + 1) + ".swf" && Boolean(this.gongMc2))
         {
            this.gongMc2.x = 12;
            this.gongMc2.y = 150;
            addChildAt(this.gongMc2,1);
            this.gongMc2.play();
         }
         else
         {
            this.loadUr2 = GameConfig.fileBaseFolder + "res/data/mc/dongxiao/" + (param1[1] + 1) + ".swf";
            _loc3_.push(new LoadData(this.loadUr2,this.com,null,null,"","gongMc2"));
         }
         if(_loc3_.length != 0)
         {
            LoaderManager.load(_loc3_);
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
               this.gongMc1.x = 12;
               this.gongMc1.y = 7;
               addChildAt(this.gongMc1,1);
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
               this.gongMc2.x = 12;
               this.gongMc2.y = 150;
               addChildAt(this.gongMc2,1);
            }
         }
      }
      
      private function updateSuoxuCount(param1:* = null) : void
      {
         var _loc3_:String = null;
         var _loc2_:int = this._count;
         if(this.useDongxiaoGoodsType == 1)
         {
            _loc2_ = this._count - 1;
         }
         if(this.useDongxiaoGoodsType == 2)
         {
            _loc2_ = 0;
         }
         _loc2_ = Math.max(0,_loc2_);
         var _loc4_:String = this._goodsName + "×" + _loc2_;
         if(this._enough)
         {
            _loc3_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + _loc4_ + "</font>";
         }
         else
         {
            _loc3_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + _loc4_ + "</font>";
         }
         this.fta4.htmlText = "<textformat leading=\'4\'>" + _loc3_ + "<br>" + "</textformat>";
         this.useBLJH.visible = GameState.gongneng164;
         this.useBLJH2.visible = GameState.gongneng165;
      }
      
      public function setZdtsBtnLabel(param1:Boolean) : void
      {
         if(param1)
         {
            this.ZidongBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         }
         else
         {
            this.ZidongBtn.label = LanResManager.getLanCommonTextWords("停止突破");
         }
      }
   }
}

