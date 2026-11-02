package com.tgame.shell.view.components.shouchongshijian
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.ShouChongShiJian700x622Skin;
   import game.utils.SkinTools;
   
   public class YN2017ShouchongshijianPanel extends BasePanel
   {
      
      public static const SCSJ_LINGQU:String = "SCSJ_LINGQU";
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      public function YN2017ShouchongshijianPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ShouChongShiJian700x622Skin.skin,"shouchongshijian");
         this.arr1 = [null,[726642,1],[724973,1],[724720,1],[723896,1],[723468,1],[309923,1],[309925,1],[309924,1]];
         this._container = new Container();
         addChild(this._container);
         this._container.x = 5;
         this._container.y = -75;
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(function():*
         {
            onClose();
         });
         this.setDataGoods(this.arr1);
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc3_:int = 1;
         while(_loc3_ < this.arr1.length)
         {
            _loc2_ = new Goods(param1[_loc3_][0]);
            _loc2_.count = param1[_loc3_][1];
            this.item = new ItemFace(_loc2_,65,65);
            this.item.x = 46 + 75.5 * (_loc3_ - 1);
            this.item.y = 372;
            this._container.addChild(this.item);
            _loc3_++;
         }
      }
      
      public function setData(param1:Object) : void
      {
         $("wenben1",this,true).attr("text",param1.num + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(SCSJ_LINGQU));
      }
   }
}

