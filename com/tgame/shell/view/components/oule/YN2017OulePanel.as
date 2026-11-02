package com.tgame.shell.view.components.oule
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.skin.OuLeSkin;
   import game.utils.SkinTools;
   
   public class YN2017OulePanel extends BasePanel
   {
      
      public static const TIJIAO:String = "2017OULETIJIAO";
      
      public static const LINGQU:String = "2017OULELINGQU";
      
      public function YN2017OulePanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(OuLeSkin.skin,"oule");
      }
      
      override protected function createVariableReference() : void
      {
         $("anniu1 anniu2",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(onClose);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         switch(int(_loc2_[1]))
         {
            case 1:
               dispatchEvent(new BaseEvent(LINGQU));
               break;
            case 2:
               dispatchEvent(new BaseEvent(TIJIAO));
         }
      }
      
      public function setData(param1:int, param2:int) : void
      {
         $("wenben1",this,true).attr("text",param1);
         $("wenben2",this,true).attr("text",param2);
      }
   }
}

