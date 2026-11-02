package com.tgame.shell.view.components.liuyuedi
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.Image;
   import game.skin.ChunTianSkin;
   import game.utils.SkinTools;
   
   public class ZhenPinZhiMengVariantPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array;
      
      private var arr2:Array;
      
      private var arr3:Array;
      
      private var arr4:Array;
      
      private var arr5:Array;
      
      private var arr6:Array;
      
      private var arr7:Array;
      
      private var arr8:Array;
      
      private var arr9:Array;
      
      private var arr10:Array;
      
      private var arr11:Array;
      
      private var arr12:Array;
      
      private var arr13:Array;
      
      private var arr14:Array = [];
      
      private var _container:Container;
      
      private var bg2:Image;
      
      private var bg3:Image;
      
      private var bg4:Image;
      
      private var bg5:Image;
      
      private var bg6:Image;
      
      private var bg7:Image;
      
      private var curBG:Image;
      
      private var curT:int;
      
      public function ZhenPinZhiMengVariantPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ChunTianSkin.skin,"chuntian");
         this._container = new Container();
         addChild(this._container);
         this.arr1 = [[713358,1],[737459,2],[715000,4],[737461,1],[732685,1],[737539,30]];
         this.arr2 = [[713358,1],[737537,1],[737460,2],[737536,1],[735848,5],[735429,6],[735756,1],[735018,1],[737539,30]];
         this.arr3 = [[713358,2],[736658,2],[737459,2],[737536,1],[737460,2],[736064,1],[737533,1],[737539,30],[737539,30]];
         this.arr4 = [[713358,1],[737537,1],[737459,2],[737536,1],[737460,2],[736074,1],[737532,1],[729909,6],[737539,30]];
         this.arr5 = [[713358,1],[736647,1],[737459,2],[737536,1],[737460,2],[735848,7],[737476,1],[726569,6],[737539,30]];
         this.arr6 = [[713358,1],[736658,2],[715000,4],[737536,1],[737460,2],[731876,1],[737461,2],[735757,1],[737539,30]];
         this.arr7 = [[713358,1],[737459,1],[713358,1],[737536,1],[737460,2],[735848,7],[60902,1],[737545,8888],[737539,30]];
         this.arr8 = [[713852,10],[735783,1],[735146,1],[713399,50],[731506,1],[734627,3]];
         this.arr9 = [[713852,10],[735783,1],[714074,2],[713852,200],[735785,1],[732730,1]];
         this.arr10 = [[713852,10],[735783,1],[713852,200],[713343,50],[731506,1],[734627,3]];
         this.arr11 = [[713852,10],[735783,1],[735429,6],[713399,50],[735785,1],[732730,1]];
         this.arr12 = [[713852,10],[735783,1],[735146,1],[713343,50],[731506,1],[734627,3]];
         this.arr13 = [[713852,10],[735783,1],[735429,6],[713399,50],[735785,1],[732730,1]];
         this.arr14 = [[713852,10],[735783,1],[714074,2],[713343,50],[731506,1],[734627,3]];
      }
      
      override protected function createVariableReference() : void
      {
         this.bg2 = getChildByName("niandizhekoutu") as Image;
         this.bg3 = getChildByName("chuntianditu1") as Image;
         this.bg4 = getChildByName("chuntianditu2") as Image;
         this.bg5 = getChildByName("chuntianditu3") as Image;
         this.bg6 = getChildByName("chuntianditu4") as Image;
         this.bg7 = getChildByName("valentine") as Image;
         this.bg2.visible = this.bg3.visible = this.bg4.visible = this.bg5.visible = this.bg6.visible = this.bg7.visible = false;
         $("anniu1111 anniu1112 anniu1113 anniu1114 anniu1115 anniu1116 anniu1117 anniu1118 anniu1119",this,true).click(this.clickHanlder);
         $("guanbianniu",this,true).click(this.onClick);
      }
      
      private function setBGVisible(param1:int) : void
      {
         if(Boolean(this.curBG) && this.curBG.visible)
         {
            this.curBG.visible = false;
         }
         switch(param1)
         {
            case 294:
               this.curBG = this.bg2;
               break;
            case 295:
               this.curBG = this.bg3;
               break;
            case 296:
               this.curBG = this.bg4;
               break;
            case 297:
               this.curBG = this.bg5;
               break;
            case 298:
               this.curBG = this.bg6;
               break;
            case 299:
               this.curBG = this.bg7;
         }
         this.curBG.visible = true;
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1111",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u111");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.curT,uint(_loc2_[1])]);
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = new Goods(param1[_loc3_][0]);
            _loc2_.count = param1[_loc3_][1];
            this.item = new ItemFace(_loc2_);
            this.item.x = 486;
            this.item.y = 308 + 43 * _loc3_;
            this._container.addChild(this.item);
            _loc3_++;
         }
      }
      
      public function setType(param1:int) : void
      {
         var _loc2_:Array = null;
         this.curT = param1;
         if(param1 == 293)
         {
            _loc2_ = this.arr1;
         }
         else if(param1 == 294)
         {
            _loc2_ = this.arr2;
         }
         else if(param1 == 295)
         {
            _loc2_ = this.arr3;
         }
         else if(param1 == 296)
         {
            _loc2_ = this.arr4;
         }
         else if(param1 == 297)
         {
            _loc2_ = this.arr5;
         }
         else if(param1 == 298)
         {
            _loc2_ = this.arr6;
         }
         else if(param1 == 299)
         {
            _loc2_ = this.arr7;
         }
         else if(param1 == 304)
         {
            _loc2_ = this.arr8;
         }
         else if(param1 == 305)
         {
            _loc2_ = this.arr9;
         }
         else if(param1 == 306)
         {
            _loc2_ = this.arr10;
         }
         else if(param1 == 307)
         {
            _loc2_ = this.arr11;
         }
         else if(param1 == 308)
         {
            _loc2_ = this.arr12;
         }
         else if(param1 == 309)
         {
            _loc2_ = this.arr13;
         }
         else if(param1 == 310)
         {
            _loc2_ = this.arr14;
         }
         this.setDataGoods(_loc2_);
         this.setBGVisible(param1);
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

