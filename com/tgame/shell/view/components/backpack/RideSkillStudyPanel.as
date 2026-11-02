package com.tgame.shell.view.components.backpack
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.Backpack;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class RideSkillStudyPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var item:ItemFace;
      
      public function RideSkillStudyPanel()
      {
         var bg:Bitmap;
         var ft:FTextArea;
         super();
         dragAble = true;
         this.skin = "sceondPanel_btn";
         this.showCloseButton = true;
         width = 254;
         height = 210;
         titleText = LanResManager.getLanTextWords(this,"学习坐骑技能");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = StaticValue.getBitmapByClassName("ui.ride.skill.study.ui");
         addChild(bg);
         bg.x = 6;
         bg.y = 33;
         ft = new FTextArea();
         with(ft)
         {
            x = 15;
            y = 15;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"坐骑学习技能");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 60;
            y = 44;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"确定坐骑学习技能");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 88;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanTextWords(this,"坐骑技能学习面板注意1") + "</textformat>";
         }
         addChild(ft);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 30;
         this.okBtn.y = 156;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = panelWidth - this.cancelBtn.width - 30;
         this.cancelBtn.y = 156;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.onClose();
               this.$parent.dispatchEvent(new BaseEvent(Backpack.UI_BACKPACK_RIDE_SKILL_STUDY,"",this.item));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function setSkill(param1:Goods = null) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         if(param1)
         {
            this.item = new ItemFace(param1);
            addChild(this.item);
            this.item.x = 18;
            this.item.y = 42;
         }
      }
   }
}

