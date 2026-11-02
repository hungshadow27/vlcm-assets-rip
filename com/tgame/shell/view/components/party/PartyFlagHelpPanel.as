package com.tgame.shell.view.components.party
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.shell.view.components.PartyFlagPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class PartyFlagHelpPanel extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var checkBox:FCheckBox;
      
      private var okBtn:SecondButton;
      
      public function PartyFlagHelpPanel()
      {
         super();
         var _loc1_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/partyHelpBg.png",675,377);
         _loc1_.x = 3;
         _loc1_.y = 3;
         addChild(_loc1_);
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 13;
         this.checkBox.y = 356;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         addChild(this.okBtn);
         this.okBtn.label = LanResManager.getLanTextWords(this,"进入帮旗操作界面");
         this.okBtn.x = (675 - this.okBtn.width) / 2;
         this.okBtn.y = 354;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkBox:
               this.$parent.dispatchEvent(new BaseEvent(PartyFlagPanel.UI_PANRTYFLAGPANEL_HELPPANEL_ISSHOW_HELPPANEL,"",this.checkBox.selectState));
               break;
            case this.okBtn:
               if(parent != null)
               {
                  this.parent.removeChild(this);
               }
               this.$parent.dispatchEvent(new BaseEvent(PartyFlagPanel.UI_PANELFLAGPANEL_HELPPAEL_OKBTN_CLICK));
         }
      }
   }
}

