package com.tgame.shell.view.components.kungfu
{
   import com.asQuery.$;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.shell.view.components.KungFuPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   import game.skin.TiangFuMianBanSkin;
   import game.utils.SkinTools;
   
   public class TianFuKungFuCanvas extends BasePanel
   {
      
      private var colorBar:ColorBar;
      
      private var _isAuto:Boolean = false;
      
      public function TianFuKungFuCanvas()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(TiangFuMianBanSkin.skin,"tianfu");
         this.colorBar = new ColorBar(5,196,11);
         this.colorBar.x = 36;
         this.colorBar.y = 150;
         addChild(this.colorBar);
      }
      
      override protected function createVariableReference() : void
      {
         $("jidutiao",this,true).attr("visible",false);
         $("jindutiaowenben",this,true).attr("visible",false);
         $("zuoshuxingwenben1",this,true).attr("text","Cấp 80 trở lên");
         $("anniu111",this,true).click(this.onClickHandler);
         $("anniu112",this,true).click(this.onClickHandler);
         $("anniu113",this,true).click(this.onClickHandler);
         $("anniu113",this,true).attr("visible",false);
      }
      
      public function set isAuto(param1:Boolean) : void
      {
         this._isAuto = param1;
         $("anniu112",this,true).attr("visible",!param1);
         $("anniu113",this,true).attr("visible",param1);
      }
      
      public function get isAuto() : Boolean
      {
         return this._isAuto;
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "anniu111":
               GameInstance.uiInstance.kungFuPanel.dispatchEvent(new BaseEvent(KungFuPanel.UI_KUNGFU_TIANFU_TUPO));
               break;
            case "anniu112":
               this.isAuto = true;
               GameInstance.uiInstance.kungFuPanel.dispatchEvent(new BaseEvent(KungFuPanel.UI_KUNGFU_TIANFU_TUPO));
               break;
            case "anniu113":
               this.isAuto = false;
         }
      }
      
      public function setData(param1:Object) : void
      {
         this.colorBar.setValue(param1.curZhuFu,param1.totalZhuFu);
         $("wenbenwenben",this,true).attr("text",param1.tianFuNum);
         $("zuoshuxingwenben2",this,true).attr("text",param1.jinpiaoNum + "Vé Vàng");
         $("zuoshuxingwenben3",this,true).attr("text",param1.chenggongNum + "%");
         if(!this.isAuto)
         {
            setTimeout(this.autoHandler,500);
         }
      }
      
      private function autoHandler() : void
      {
         GameInstance.uiInstance.kungFuPanel.dispatchEvent(new BaseEvent(KungFuPanel.UI_KUNGFU_TIANFU_TUPO));
      }
      
      public function setUpSuccess(param1:Boolean) : void
      {
         if(!param1)
         {
            this.isAuto = false;
         }
      }
   }
}

