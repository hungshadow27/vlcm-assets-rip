package com.tgame.shell.view.components.wudushengzhen
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.skin.KuangBaoSkin;
   import game.utils.SkinTools;
   
   public class YN2017WudushengzhenPanel extends BasePanel
   {
      
      public static const WDSZ_LINGQU:String = "WDSZ_LINGQU";
      
      private var _arr:Array = [];
      
      public function YN2017WudushengzhenPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(KuangBaoSkin.skin,"fangyanhua");
         this.init();
      }
      
      private function init() : void
      {
         $("anniu1 anniu2 anniu3 anniu4 anniu5 anniu6 anniu7 anniu8 anniu9",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(function():*
         {
            onClose();
         });
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("niu");
         dispatchEvent(new BaseEvent(WDSZ_LINGQU,"",[this._arr[uint(_loc2_[1]) - 1]]));
      }
      
      public function setData(param1:Object) : void
      {
         this._arr = [];
         $("fanlibiaoti",this,true).attr("text","" + param1.biaoti);
         $("wenben2",this,true).attr("text","" + param1.time);
         $("wenben4",this,true).attr("text","" + param1.miaoshu);
         $("wenben5",this,true).attr("text","Vàng Tích lũy: " + param1.cishu + "\n" + "\rĐiều kiện phải nhận theo thứ tự từ thấp đến cao.");
         var _loc2_:int = 0;
         while(_loc2_ < param1.arr.length)
         {
            this._arr.push(param1.arr[_loc2_].onlyId);
            _loc2_++;
         }
         $("wenben6",this,true).attr("text","" + param1.arr[0].txt1);
         $("wenben7",this,true).attr("text","" + param1.arr[0].txt2);
         $("wenben8",this,true).attr("text","" + param1.arr[1].txt1);
         $("wenben9",this,true).attr("text","" + param1.arr[1].txt2);
         $("wenben10",this,true).attr("text","" + param1.arr[2].txt1);
         $("wenben11",this,true).attr("text","" + param1.arr[2].txt2);
         $("wenben12",this,true).attr("text","" + param1.arr[3].txt1);
         $("wenben13",this,true).attr("text","" + param1.arr[3].txt2);
         $("wenben14",this,true).attr("text","" + param1.arr[4].txt1);
         $("wenben15",this,true).attr("text","" + param1.arr[4].txt2);
         $("wenben16",this,true).attr("text","" + param1.arr[5].txt1);
         $("wenben17",this,true).attr("text","" + param1.arr[5].txt2);
         $("wenben18",this,true).attr("text","" + param1.arr[6].txt1);
         $("wenben19",this,true).attr("text","" + param1.arr[6].txt2);
         $("wenben20",this,true).attr("text","" + param1.arr[7].txt1);
         $("wenben21",this,true).attr("text","" + param1.arr[7].txt2);
         $("wenben22",this,true).attr("text","" + param1.arr[8].txt1);
         $("wenben23",this,true).attr("text","" + param1.arr[8].txt2);
      }
   }
}

