package com.tgame.shell.view.components.shuiguoleiji
{
   import com.asQuery.$;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import game.skin.YueNanJieMianSkin;
   import game.utils.SkinTools;
   
   public class ShuiGuoLeiJiPanel extends BasePanel
   {
      
      private var title:FTextArea;
      
      public function ShuiGuoLeiJiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YueNanJieMianSkin.skin,"peiyangdianfengshou");
         this.init();
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.size = 18;
         _loc1_.bold = true;
         this.title = new FTextArea();
         this.title.defaultTextFormat = _loc1_;
         this.title.x = 227;
         this.title.y = 7;
         this.title.textColor = StaticValue.GREEN_STRONG;
         this.title.filters = StaticValue.filter;
         this.title.width = 170;
         this.title.height = 20;
         this.title.htmlText = "Tích Lũy Trái Cây";
         this.title.mouseEnabled = false;
         addChild(this.title);
      }
      
      private function init() : void
      {
         $("lingqu1 lingqu2 lingqu3 lingqu4 lingqu5 lingqu6 lingqu7",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben2",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[92,uint(_loc2_[1])]);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

