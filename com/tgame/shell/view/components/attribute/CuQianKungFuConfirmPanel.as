package com.tgame.shell.view.components.attribute
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class CuQianKungFuConfirmPanel extends FPanel
   {
      
      public static const UI_CUQIANKUNGFU_CONFIRM_PANEL_ISSHOW:String = "UI_CUQIANKUNGFU_CONFIRM_PANEL_ISSHOW";
      
      public static const UI_CUQIANKUNGFU_CONFIRM_PANEL_OKBTN_CLICK:String = "UI_CUQIANKUNGFU_CONFIRM_PANEL_OKBTN_CLICK";
      
      public var checkBox:FCheckBox;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function CuQianKungFuConfirmPanel()
      {
         var _loc1_:FTextArea = null;
         super();
         skin = "sceondPanel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 225;
         height = 155;
         titleText = LanResManager.getLanCommonTextWords("挑战确认");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = new FTextArea();
         _loc1_.x = 15;
         _loc1_.y = 5;
         _loc1_.textColor = StaticValue.WHITE;
         _loc1_.width = 225;
         _loc1_.height = 80;
         _loc1_.htmlText = LanResManager.getLanCommonTextWords("挑战时需要交付元宝") + "<br>" + LanResManager.getLanCommonTextWords("挑战成功时，将获得大量金票奖励。") + "<br>" + LanResManager.getLanCommonTextWords("押金越高，金票越多。") + "<br>" + LanResManager.getLanCommonTextWords("是否确认挑战。");
         addChild(_loc1_);
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.textColor = StaticValue.WHITE;
         this.checkBox.text = LanResManager.getLanCommonTextWords("不再显示");
         this.checkBox.x = 80;
         this.checkBox.y = 70;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         addChild(this.okBtn);
         this.okBtn.label = LanResManager.getLanCommonTextWords("确认");
         this.okBtn.x = 25;
         this.okBtn.y = 102;
         this.okBtn.paddingLeft = 20;
         this.okBtn.width = 64;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         addChild(this.cancelBtn);
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         this.cancelBtn.x = 130;
         this.cancelBtn.y = 102;
         this.cancelBtn.paddingLeft = 20;
         this.cancelBtn.width = 64;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkBox:
               this.dispatchEvent(new BaseEvent(UI_CUQIANKUNGFU_CONFIRM_PANEL_ISSHOW,"",this.checkBox.selectState));
               break;
            case this.okBtn:
               if(parent != null)
               {
                  this.parent.removeChild(this);
               }
               this.dispatchEvent(new BaseEvent(UI_CUQIANKUNGFU_CONFIRM_PANEL_OKBTN_CLICK));
               break;
            case this.cancelBtn:
               if(parent != null)
               {
                  this.parent.removeChild(this);
               }
         }
      }
   }
}

