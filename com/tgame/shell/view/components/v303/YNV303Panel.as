package com.tgame.shell.view.components.v303
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.skin.YNzhouqiyouhuiSkin;
   import game.utils.SkinTools;
   
   public class YNV303Panel extends BasePanel
   {
      
      public static const V303_LINGQU:String = "V303_LINGQU";
      
      public function YNV303Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YNzhouqiyouhuiSkin.skin,"zhouqiyouhui");
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(function():*
         {
            onClose();
         });
      }
      
      public function setData(param1:Object) : void
      {
         $("wenben1",this,true).attr("text","" + param1.cishu);
         var _loc2_:int = 0;
         while(_loc2_ < param1.arr.length)
         {
            $("DFZQLQAN" + int(_loc2_ + 1),this,true).attr("name",param1.arr[_loc2_].onlyId);
            _loc2_++;
         }
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(V303_LINGQU,"",[param1.target.name]));
      }
   }
}

