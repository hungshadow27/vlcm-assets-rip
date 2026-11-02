package com.tgame.shell.view.components.equippuddingTwo
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.ItemTip;
   import com.tgame.shell.view.components.EquipPuddingTwoPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.*;
   import flash.text.*;
   
   public class ModifyEquipAttibuteCountConfirmPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var att1:FTextArea;
      
      private var value1:FTextArea;
      
      private var att2:FTextArea;
      
      private var value2:FTextArea;
      
      private var btn1:SecondButton;
      
      private var btn2:SecondButton;
      
      public function ModifyEquipAttibuteCountConfirmPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         var ft:FTextArea;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = false;
         width = 327;
         height = 322;
         titleText = LanResManager.getLanCommonTextWords("属性重置");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.equip.pudding.attribute.reset.title";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         DynamicManageImages = v;
         this.att1 = new FTextArea();
         with(this.att1)
         {
            x = 23;
            y = 35;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.att1);
         this.value1 = new FTextArea();
         with(this.value1)
         {
            x = 103;
            y = 35;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         addChild(this.value1);
         this.att2 = new FTextArea();
         with(this.att2)
         {
            x = 176;
            y = 35;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.att2);
         this.value2 = new FTextArea();
         with(this.value2)
         {
            x = 257;
            y = 35;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         addChild(this.value2);
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 220;
            width = 307;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"新增附加属性成功");
         }
         addChild(ft);
         this.btn1 = new SecondButton();
         with(this.btn1)
         {
            label = LanResManager.getLanTextWords(this,"保留老属性");
            x = 50;
            y = 256;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.btn1);
         this.btn2 = new SecondButton();
         with(this.btn2)
         {
            label = LanResManager.getLanTextWords(this,"使用新属性");
            x = this.panelWidth - 50 - btn2.width;
            y = 256;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.btn2);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               this.$parent.dispatchEvent(new BaseEvent(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_OLD));
               break;
            case this.btn2:
               this.$parent.dispatchEvent(new BaseEvent(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_NEW));
         }
         this.onClose();
      }
      
      public function setAtt(param1:String, param2:String) : void
      {
         var _loc4_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc3_:Array = param1.split(";");
         var _loc5_:int = int(_loc3_.length);
         _loc6_ = "<textformat leading=\'6\'>";
         _loc7_ = "<textformat leading=\'6\'>";
         _loc4_ = 0;
         while(_loc4_ < _loc5_ - 1)
         {
            _loc8_ = _loc3_[_loc4_].split(",");
            _loc6_ += ItemTip.fightAttr["a" + _loc8_[0]] + "<br>";
            _loc7_ += "+" + _loc8_[1] + "<br>";
            _loc4_++;
         }
         _loc6_ += "</textformat>";
         _loc7_ += "</textformat>";
         this.att1.htmlText = _loc6_;
         this.value1.htmlText = _loc7_;
         _loc3_ = param2.split(";");
         _loc5_ = int(_loc3_.length);
         _loc6_ = "<textformat leading=\'6\'>";
         _loc7_ = "<textformat leading=\'6\'>";
         _loc4_ = 0;
         while(_loc4_ < _loc5_ - 1)
         {
            _loc8_ = _loc3_[_loc4_].split(",");
            _loc6_ += ItemTip.fightAttr["a" + _loc8_[0]] + "<br>";
            _loc7_ += "+" + _loc8_[1] + "<br>";
            _loc4_++;
         }
         _loc6_ += "</textformat>";
         _loc7_ += "</textformat>";
         this.att2.htmlText = _loc6_;
         this.value2.htmlText = _loc7_;
      }
   }
}

