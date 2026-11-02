package com.tgame.shell.view.components.shuiguoleiji
{
   import com.asQuery.$;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.display.Stepper;
   import game.skin.YueNanXiaoJieMianSkin;
   import game.utils.SkinTools;
   
   public class ShuiGuoLeiJiDuiHuanPanel extends BasePanel
   {
      
      public static const SHUIGUOLEIJI_DUIHUA_CLICK:String = "SHUIGUOLEIJI_DUIHUA_CLICK";
      
      private var title:FTextArea;
      
      private var stepper:Stepper;
      
      private var curType:int = 0;
      
      public function ShuiGuoLeiJiDuiHuanPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YueNanXiaoJieMianSkin.skin,"xiaojiemian");
         this.title = new FTextArea();
         this.title.x = 74;
         this.title.y = 30;
         this.title.textColor = StaticValue.WHITE;
         this.title.width = 170;
         this.title.height = 20;
         this.title.htmlText = "Ghép Trái Cây";
         this.title.mouseEnabled = false;
         this.title.filters = StaticValue.filter;
         addChild(this.title);
         this.init();
      }
      
      private function init() : void
      {
         $("quxiao",this,true).click(this.onClickHandler);
         $("queren",this,true).click(this.onClickHandler);
      }
      
      override protected function createVariableReference() : void
      {
         this.stepper = getChildByName("stepper") as Stepper;
         this.stepper.minimum = 1;
         this.stepper.maximum = 50;
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "quxiao":
               onClose();
               break;
            case "queren":
               if(this.stepper.value <= 0)
               {
                  return;
               }
               dispatchEvent(new BaseEvent(SHUIGUOLEIJI_DUIHUA_CLICK,"",{
                  "type":this.curType,
                  "num":this.stepper.value
               }));
         }
      }
      
      public function setData(param1:int) : void
      {
         this.curType = param1;
      }
   }
}

