package com.tgame.shell.view.components.tengtianyu
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.skin.YNNewTengtianyu2Skin;
   import game.utils.SkinTools;
   
   public class YN2017Tengtianyu3Panel extends BasePanel
   {
      
      public static const WDSZ23_LINGQU:String = "WDSZ23_LINGQU";
      
      public function YN2017Tengtianyu3Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YNNewTengtianyu2Skin.skin,"tengtiantyu2");
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7 DFZQLQAN8 DFZQLQAN9",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(function():*
         {
            onClose();
         });
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(WDSZ23_LINGQU,"",[param1.target.name]));
      }
      
      public function setData(param1:Object) : void
      {
         $("wenben1",this,true).attr("text","" + param1.cishu);
         $("wenben2",this,true).attr("text","" + param1.time);
         var _loc2_:int = 0;
         while(_loc2_ < param1.arr.length)
         {
            $("DFZQLQAN" + int(_loc2_ + 1),this,true).attr("name",param1.arr[_loc2_].onlyId);
            _loc2_++;
         }
      }
   }
}

