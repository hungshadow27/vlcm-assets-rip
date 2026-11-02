package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class FashionPanel extends FPanel
   {
      
      public static const UI_FASHION_FANYE_CLICK:String = "UI_FASHION_FANYE_CLICK";
      
      public static const UI_SAVEFASHION_CLICK:String = "UI_SAVEFASHION_CLICK";
      
      public static const UI_CANCEL_CLICK:String = "UI_CANCEL_CLICK";
      
      public static const UI_XIEXIA_CLICK:String = "UI_XIEXIA_CLICK";
      
      public static const UI_SHICHUAN_FASHION_CLICK:String = "UI_SHICHUAN_FASHION_CLICK";
      
      private var bg:DisplayObject;
      
      private var previousButton:SecondButton;
      
      private var ftPage:FTextArea;
      
      private var nextButton:SecondButton;
      
      private var saveBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var xiexiaBtn:SecondButton;
      
      private var ft:FTextArea;
      
      private var ftValue1:FTextArea;
      
      private var ftValue2:FTextArea;
      
      private var select:MovieClip;
      
      private var spr:Sprite;
      
      private var fashionID:int = 0;
      
      private var _avatar:Bitmap;
      
      public function FashionPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 487;
         height = 373;
         titleText = LanResManager.getLanCommonTextWords("时装试衣间");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fashion/fashion_bg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.spr = new Sprite();
         with(this.spr.graphics)
         {
            beginFill(65535,0);
            drawRect(0,0,300,190);
            endFill();
         }
         this.spr.x = 195;
         this.spr.y = 25;
         addChild(this.spr);
         this.ft = new FTextArea();
         this.ft.x = 73;
         this.ft.y = 5;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("效果展示") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 315;
         this.ft.y = 5;
         this.ft.height = 30;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("时装") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 200;
         this.ft.y = 252;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成") + "：</font>";
         addChild(this.ft);
         this.ftValue1 = new FTextArea();
         this.ftValue1.x = 200;
         this.ftValue1.y = 272;
         this.ftValue1.htmlText = "";
         this.ftValue1.width = 150;
         addChild(this.ftValue1);
         this.ftValue2 = new FTextArea();
         this.ftValue2.x = 340;
         this.ftValue2.y = 272;
         this.ftValue2.htmlText = "";
         this.ftValue2.width = 150;
         addChild(this.ftValue2);
         this.previousButton = new SecondButton();
         this.previousButton.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.previousButton);
         this.previousButton.x = 272;
         this.previousButton.y = 223;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ftPage = new FTextArea();
         this.ftPage.x = 328 - 10;
         this.ftPage.y = 228 - 2;
         this.ftPage.htmlText = "1/1";
         this.ftPage.background = true;
         this.ftPage.backgroundColor = 1186072;
         this.ftPage.width = 20 + 4;
         this.ftPage.height = 16;
         this.ftPage.textColor = StaticValue.WHITE;
         addChild(this.ftPage);
         this.ftPage.autoSize = TextFieldAutoSize.CENTER;
         this.nextButton = new SecondButton();
         this.nextButton.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.nextButton);
         this.nextButton.x = this.ftPage.x + 20;
         this.nextButton.y = 223;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.saveBtn = new SecondButton();
         this.saveBtn.x = 30;
         this.saveBtn.y = 297;
         this.saveBtn.label = LanResManager.getLanCommonTextWords("保存");
         addChild(this.saveBtn);
         this.saveBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.x = 120;
         this.cancelBtn.y = 297;
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("放弃");
         addChild(this.cancelBtn);
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.xiexiaBtn = new SecondButton();
         this.xiexiaBtn.x = 210;
         this.xiexiaBtn.y = 297;
         this.xiexiaBtn.label = LanResManager.getLanCommonTextWords("卸下");
         addChild(this.xiexiaBtn);
         this.xiexiaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         this._avatar.x = 96 - this._avatar.width / 2 + 5;
         this._avatar.y = 342 - this._avatar.height - 55;
      }
      
      public function setAvaterXY(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         if(param1)
         {
            this._avatar.x = 96 - this._avatar.width / 2 + 5;
            this._avatar.y = 342 - this._avatar.height - 55;
         }
         else
         {
            this._avatar.x = param2;
            this._avatar.y = param3;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.target)
         {
            case this.previousButton:
               dispatchEvent(new BaseEvent(UI_FASHION_FANYE_CLICK,"",1));
               break;
            case this.nextButton:
               dispatchEvent(new BaseEvent(UI_FASHION_FANYE_CLICK,"",2));
               break;
            case this.saveBtn:
               if(this.fashionID == 0)
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("请选择要保存的时装，\n可点击试穿按钮预览效果！");
                  FAlert.show("Hãy chọn Ngoại Trang lưu, có thể nhấp vào nút xem hiệu ứng!",LanResManager.getLanCommonTextWords("提示"));
                  return;
               }
               dispatchEvent(new BaseEvent(UI_SAVEFASHION_CLICK,"",this.fashionID));
               break;
            case this.cancelBtn:
               if(this.fashionID == 0)
               {
                  return;
               }
               this.fashionID = 0;
               dispatchEvent(new BaseEvent(UI_CANCEL_CLICK));
               break;
            case this.xiexiaBtn:
               dispatchEvent(new BaseEvent(UI_XIEXIA_CLICK));
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.select != null && this.select.parent != null)
         {
            this.select.parent.removeChild(this.select);
         }
         var _loc2_:ItemFace = param1.currentTarget as ItemFace;
         this.select = StaticValue.getMCByClassName("ui.skill.default") as MovieClip;
         this.spr.addChild(this.select);
         this.select.x = _loc2_.x;
         this.select.y = _loc2_.y;
         this.select.mouseEnabled = false;
         this.select.mouseChildren = false;
         this.fashionID = int(_loc2_.name);
         dispatchEvent(new BaseEvent(UI_SHICHUAN_FASHION_CLICK,"",_loc2_.name));
      }
      
      private function onClick1(param1:MouseEvent) : void
      {
         var _loc4_:ItemFace = null;
         var _loc2_:SecondButton = param1.target as SecondButton;
         var _loc3_:Array = _loc2_.name.split(",");
         if(_loc3_.length > 0)
         {
            this.fashionID = int(_loc3_[0]);
            dispatchEvent(new BaseEvent(UI_SHICHUAN_FASHION_CLICK,"",this.fashionID));
            if(this.select != null && this.select.parent != null)
            {
               this.select.parent.removeChild(this.select);
            }
            _loc4_ = param1.currentTarget as ItemFace;
            this.select = StaticValue.getMCByClassName("ui.skill.default") as MovieClip;
            this.spr.addChild(this.select);
            this.select.x = int(_loc3_[1]);
            this.select.y = int(_loc3_[2]);
            this.select.mouseEnabled = false;
            this.select.mouseChildren = false;
         }
      }
      
      public function setInit(param1:int, param2:int, param3:Array) : void
      {
         var _loc7_:Bitmap = null;
         var _loc8_:Goods = null;
         var _loc9_:ItemFace = null;
         var _loc10_:SecondButton = null;
         this.ftPage.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "/" + param2 + "</font>";
         if(param1 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param1 == param2)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         if(param2 == 0)
         {
            this.previousButton.enabled = false;
            this.nextButton.enabled = false;
         }
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < param3.length)
         {
            if(_loc6_ == 3)
            {
               _loc4_ = 0;
               _loc5_ = 1;
            }
            _loc7_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc7_.x = 30 + 90 * _loc4_ - 2;
            _loc7_.y = 25 + 90 * _loc5_ - 2;
            this.spr.addChild(_loc7_);
            _loc8_ = param3[_loc6_] as Goods;
            _loc9_ = new ItemFace(_loc8_);
            _loc9_.name = _loc8_.id.toString();
            _loc9_.x = 30 + 90 * _loc4_;
            _loc9_.y = 25 + 90 * _loc5_;
            this.spr.addChild(_loc9_);
            _loc9_.addEventListener(MouseEvent.CLICK,this.onItemClick);
            _loc10_ = new SecondButton();
            _loc10_.name = _loc8_.id.toString() + "," + _loc9_.x + "," + _loc9_.y;
            _loc10_.x = 42 + 90 * _loc4_ - 20;
            _loc10_.y = 42 + 90 * _loc5_ + 25;
            _loc10_.label = LanResManager.getLanCommonTextWords("试  穿");
            _loc10_.addEventListener(MouseEvent.CLICK,this.onClick1);
            this.spr.addChild(_loc10_);
            _loc4_++;
            _loc6_++;
         }
      }
      
      public function setValue(param1:String) : void
      {
         var _loc6_:int = 0;
         var _loc2_:Array = param1.split(",");
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc5_:int = 0;
         if(_loc2_.length % 2 == 0)
         {
            _loc5_ = _loc2_.length / 2;
         }
         else
         {
            _loc5_ = _loc2_.length / 2 + 1;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ += "" + _loc2_[_loc6_] + "<br>";
            _loc6_++;
         }
         _loc6_ = _loc5_;
         while(_loc6_ < _loc2_.length)
         {
            _loc4_ += "" + _loc2_[_loc6_] + "<br>";
            _loc6_++;
         }
         this.ftValue1.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + _loc3_ + "</font>";
         this.ftValue2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + _loc4_ + "</font>";
      }
   }
}

