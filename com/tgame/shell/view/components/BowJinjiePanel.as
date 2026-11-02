package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class BowJinjiePanel extends FPanel
   {
      
      public static const UI_ANQITUPOPINGJINGTISHI_JIXUTUPO_CLICK:String = "UI_ANQITUPOPINGJINGTISHI_JIXUTUPO_CLICK";
      
      public var $parent:DisplayObject;
      
      public var $this:DisplayObject;
      
      private var kuang:Bitmap;
      
      private var fta:FTextArea;
      
      private var ftat:FTextArea;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var ftJL:FTextArea;
      
      private var gmBtn:SecondButton;
      
      private var ksjjBtn:SecondButton;
      
      private var zdjjBtn:SecondButton;
      
      private var item:ItemFace;
      
      private var xingyunzhiMc:MovieClip;
      
      private var xingyunzhiNum:int;
      
      private var gongMc1:MovieClip;
      
      private var gongMc2:MovieClip;
      
      private var time:int;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var gongMcId1:int;
      
      private var gongMcId2:int;
      
      private var loadUrl1:String;
      
      private var loadUrl2:String;
      
      private var line:Bitmap;
      
      private var xingyunzhiCount:int;
      
      private var addXyz:int;
      
      private var useLongShouJinUpdataBtn:SecondButton;
      
      private var ftTime:FTextArea;
      
      private var TimeInt:int;
      
      private var dqgj:int;
      
      private var ft_zfzDesc:FTextArea;
      
      public function BowJinjiePanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 427;
         height = 436;
         titleText = LanResManager.getLanCommonTextWords("弓箭进阶");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.char.archery.updata.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.kuang = StaticValue.getBitmapByClassName("ui.char.archery.slot");
         addChild(this.kuang);
         this.kuang.x = 43;
         this.kuang.y = 14;
         this.kuang = StaticValue.getBitmapByClassName("ui.char.archery.slot");
         addChild(this.kuang);
         this.kuang.x = 250;
         this.kuang.y = 14;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 40;
            y = 194;
            textColor = StaticValue.SKY_BLUE;
            text = LanResManager.getLanTextWords(this,"您当前弓箭");
         }
         addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 118;
            y = 192;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.fta1);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 251 - 25;
            y = 194;
            textColor = StaticValue.SKY_BLUE;
            text = LanResManager.getLanTextWords(this,"可进阶为");
         }
         addChild(this.fta);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 316;
            y = 192;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.fta2);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 57;
            y = 222 - 10;
            textColor = StaticValue.YELLOW;
            text = LanResManager.getLanCommonTextWords("进阶材料");
         }
         addChild(this.fta);
         this.ft_zfzDesc = new FTextArea();
         with(this.ft_zfzDesc)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 65;
            y = 228 + 72 + 8;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanCommonTextWords("当幸运值累计2500点时必定成功") + "<br>";
            visible = false;
         }
         addChild(this.ft_zfzDesc);
         this.gmBtn = new SecondButton();
         this.gmBtn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(this.gmBtn);
         this.gmBtn.x = 63;
         this.gmBtn.y = 282;
         this.gmBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.gmBtn.visible = false;
         this.ftat = new FTextArea();
         with(this.ftat)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 125 - 10;
            y = 228;
            textColor = StaticValue.YELLOW;
            htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"进阶幸运值") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"当前累积幸运值") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"本次进阶消耗铜币") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"本次进阶消耗材料") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"本次进阶成功几率料") + "</font>" + "</textformat>";
         }
         addChild(this.ftat);
         this.ftat.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.ftat.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 233 - 10;
            y = 228;
            textColor = StaticValue.YELLOW;
            htmlText = "";
         }
         addChild(this.fta3);
         this.ftJL = new FTextArea();
         with(this.ftJL)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 30 + 35;
            y = 311;
            textColor = StaticValue.YELLOW;
            htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("由于本级的特殊性，进阶时无法使用超级锻造材料") + "</font>";
         }
         addChild(this.ftJL);
         this.xingyunzhiMc = StaticValue.getMCByClassName("ui.char.archery.movie") as MovieClip;
         addChild(this.xingyunzhiMc);
         this.xingyunzhiMc.x = 196;
         this.xingyunzhiMc.y = 224;
         this.ksjjBtn = new SecondButton();
         this.ksjjBtn.label = LanResManager.getLanCommonTextWords("开始进阶");
         addChild(this.ksjjBtn);
         this.ksjjBtn.x = 318;
         this.ksjjBtn.y = 223;
         this.ksjjBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.zdjjBtn = new SecondButton();
         this.zdjjBtn.label = LanResManager.getLanCommonTextWords("自动进阶");
         addChild(this.zdjjBtn);
         this.zdjjBtn.x = 318;
         this.zdjjBtn.y = 253;
         this.zdjjBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.useLongShouJinUpdataBtn = new SecondButton();
         this.useLongShouJinUpdataBtn.label = LanResManager.getLanCommonTextWords("用神奇龙兽筋提升");
         addChild(this.useLongShouJinUpdataBtn);
         this.useLongShouJinUpdataBtn.x = 300;
         this.useLongShouJinUpdataBtn.y = 301;
         this.useLongShouJinUpdataBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.line = StaticValue.getBitmapByClassName("ui.ride.ico.exclamation");
         addChild(this.line);
         this.line.x = 30;
         this.line.y = 342;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 80;
            y = 330 - 3;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'0\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"每次进阶失败均会为您") + "</font>" + "</textformat>";
         }
         addChild(this.fta);
         this.ftTime = new FTextArea();
         with(this.ftTime)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 80;
            y = 330 - 3 + 30;
            textColor = StaticValue.RED;
            htmlText = "";
         }
         addChild(this.ftTime);
      }
      
      private function aa(param1:Event = null) : void
      {
         var ftaw:FTextArea;
         var e:Event = param1;
         this.xingyunzhiMc.gotoAndStop(this.xingyunzhiNum);
         ftaw = new FTextArea();
         with(ftaw)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = 196;
            y = 234;
            textColor = StaticValue.YELLOW;
            width = 80;
            htmlText = "+" + String(xingyunzhiNum);
         }
         if(this.addXyz > 0)
         {
            ftaw.htmlText = "+" + String(this.xingyunzhiNum) + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "+" + String(this.addXyz) + "</font>";
         }
         addChild(ftaw);
         TweenMax.to(ftaw,1,{
            "y":204,
            "onComplete":this.onCom,
            "onCompleteParams":[ftaw]
         });
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.ftat.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.ftat.getCharIndexAtPoint(this.ftat.mouseX,this.ftat.mouseY);
               if(_loc2_ >= this.ftat.text.indexOf(LanResManager.getLanTextWords(this,"幸运值")) && _loc2_ <= this.ftat.text.indexOf(LanResManager.getLanTextWords(this,"幸运值")) + 4)
               {
                  _loc3_ = LanResManager.getLanTextWords(this,"注意1");
                  this.showTip(_loc3_);
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.ftat.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY - 15;
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         var str:String = null;
         var str1:String = null;
         var str2:String = null;
         var str3:String = null;
         var e:FCloseEvent = param1;
         if(this.xingyunzhiCount > 0)
         {
            this.$this = this;
            str = "";
            str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"当前累积幸运值") + this.xingyunzhiCount + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"每次进阶失败均会为您") + "</font>";
            if(this.TimeInt > 0)
            {
               str1 = LanResManager.getLanCommonTextWords("幸运值清空倒计时：");
               str2 = LanResManager.getLanCommonTextWords("时");
               str3 = LanResManager.getLanCommonTextWords("分");
               str += "<font color=\'" + StaticValue.RED_HTML + "\'>" + str1 + int(this.TimeInt / 60 / 60 % 24) + str2 + int(this.TimeInt / 60 % 60) + str3 + "</font>";
            }
            str += "</textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续进阶");
            FAlert.show(str,LanResManager.getLanCommonTextWords("弓箭进阶"),2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  removeMc();
                  $parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOWJINJIE_CLOSE_CLICK));
                  parent.removeChild($this);
               }
            });
         }
         else
         {
            this.removeMc();
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOWJINJIE_CLOSE_CLICK));
            if(parent != null)
            {
               parent.removeChild(this);
            }
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.gmBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOWJINJIE_GOUMAI_CLICK,"",this.item.getBaseItem().id));
               break;
            case this.ksjjBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOWJINJIE_KAISHIJINJIE_CLICK));
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOWJINJIE_ZIDONGJINJIE_CLICK,"",false));
               break;
            case this.zdjjBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOWJINJIE_ZIDONGJINJIE_CLICK));
               break;
            case this.useLongShouJinUpdataBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOWJINJIE_USE_SHENQILONGSHOUJIN_CLICK));
         }
      }
      
      public function setGoods(param1:Goods, param2:Boolean = true) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 65;
         this.item.y = 239;
         addChild(this.item);
         if(!param2)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.item.filters = [];
         }
      }
      
      public function setBow(param1:String, param2:int, param3:String, param4:int) : void
      {
         this.fta1.text = param1;
         this.fta2.text = param3;
         this.dqgj = param2;
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
         this.loadUrl1 = GameConfig.fileBaseFolder + "res/data/mc/gongjian/gongjian" + param2 + ".swf";
         this.loadUrl2 = GameConfig.fileBaseFolder + "res/data/mc/gongjian/gongjian" + param4 + ".swf";
         var _loc5_:Array = [new LoadData(this.loadUrl1,this.com,null,null,"","gongMc1"),new LoadData(this.loadUrl2,this.com,null,null,"","gongMc2")];
         LoaderManager.load(_loc5_);
         if(param2 == 7)
         {
            this.ft_zfzDesc.visible = true;
            this.ft_zfzDesc.y = 295;
            this.ftJL.visible = true;
            this.ftat.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"进阶幸运值") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"当前累积幸运值") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"本次进阶消耗铜币") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"本次进阶消耗材料") + "<br></font>" + "</textformat>";
         }
         else
         {
            this.ft_zfzDesc.visible = false;
            this.ftJL.visible = false;
         }
      }
      
      private function com(param1:Event) : void
      {
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         var _loc3_:String = _loc2_._id;
         if(_loc3_ == "gongMc1")
         {
            if(_loc2_.url.url != this.loadUrl1)
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
               this.gongMc1.x = 45;
               this.gongMc1.y = 21;
               addChildAt(this.gongMc1,1);
            }
         }
         else if(_loc3_ == "gongMc2")
         {
            if(_loc2_.url.url != this.loadUrl2)
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
               this.gongMc2.x = 252;
               this.gongMc2.y = 21;
               addChildAt(this.gongMc2,1);
            }
         }
      }
      
      public function setXingyunzhi(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int = 0) : void
      {
         this.xingyunzhiCount = param6;
         var _loc7_:String = "";
         _loc7_ = "<textformat leading=\'1\'><br>";
         _loc7_ = _loc7_ + ("<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param6 + "<br></font>");
         if(param4)
         {
            _loc7_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + "<br></font>";
         }
         else
         {
            _loc7_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "<br></font>";
         }
         if(param5)
         {
            _loc7_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param2 + "<br></font>";
         }
         else
         {
            _loc7_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + param2 + "<br></font>";
         }
         if(this.dqgj < 7)
         {
            _loc7_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param3 + "%</font>";
         }
         _loc7_ += "<br/></textformat>";
         this.fta3.htmlText = _loc7_;
      }
      
      public function xingyunzhiPlay() : void
      {
         this.xingyunzhiMc.play();
      }
      
      public function xingyunzhiStop(param1:int) : void
      {
         if(param1 != 0)
         {
            this.xingyunzhiNum = param1;
            this.aa();
         }
      }
      
      private function onCom(param1:FTextArea) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      public function removeMc() : void
      {
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
         this.xingyunzhiMc.gotoAndStop(1);
      }
      
      public function addXingyunzhi(param1:int) : void
      {
         this.addXyz = param1;
      }
      
      public function setZdtsBtnLabel(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdjjBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         }
         else
         {
            this.zdjjBtn.label = LanResManager.getLanCommonTextWords("停止突破");
         }
      }
      
      public function setRTime(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         this.TimeInt = param1;
         if(this.TimeInt <= 0)
         {
            this.ftTime.htmlText = "";
         }
         else
         {
            _loc2_ = LanResManager.getLanCommonTextWords("幸运值清空倒计时：");
            _loc3_ = LanResManager.getLanCommonTextWords("时");
            _loc4_ = LanResManager.getLanCommonTextWords("分");
            this.ftTime.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + _loc2_ + int(this.TimeInt / 60 / 60 % 24) + _loc3_ + int(this.TimeInt / 60 % 60) + _loc4_ + "</font>";
         }
      }
   }
}

