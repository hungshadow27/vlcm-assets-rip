package com.tgame.shell.view.components.tengtianyu
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.skin.YNNewTengtianyuSkin;
   import game.utils.SkinTools;
   
   public class YN2017Tengtianyu2Panel extends BasePanel
   {
      
      public static const WDSZ22_LINGQU:String = "WDSZ22_LINGQU";
      
      public function YN2017Tengtianyu2Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YNNewTengtianyuSkin.skin,"tengtiantyu");
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
         dispatchEvent(new BaseEvent(WDSZ22_LINGQU,"",[param1.target.name]));
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

