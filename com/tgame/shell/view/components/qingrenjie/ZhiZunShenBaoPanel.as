package com.tgame.shell.view.components.qingrenjie
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.ZhiZhunShenBao20190418Skin;
   import game.utils.SkinTools;
   
   public class ZhiZunShenBaoPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      private var _container:Container;
      
      private var currType:int;
      
      public function ZhiZunShenBaoPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ZhiZhunShenBao20190418Skin.skin,"zhizunshenbao");
         this._container = new Container();
         addChild(this._container);
         this._container.x = -37;
         this._container.y = -42;
         this.arr1 = [null,[729089,6],[713399,10],[729748,1],[730507,10000],[731277,1]];
         this.arr2 = [null,[726642,10],[728608,1],[729909,1],[730742,1],[729177,15]];
         this.init();
      }
      
      private function init() : void
      {
         $("anniuanniuAN1 anniuanniuAN2 anniuanniuAN3 anniuanniuAN4 anniuanniuAN5 anniuanniuAN6 anniuanniuAN7",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.currType,uint(_loc2_[1])]);
      }
      
      public function setDataGoods(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Goods = null;
         this.currType = param1;
         switch(param1)
         {
            case 204:
               _loc2_ = this.arr1;
               break;
            case 227:
               _loc2_ = this.arr2;
         }
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc4_:int = 1;
         while(_loc4_ < this.arr1.length)
         {
            _loc3_ = new Goods(_loc2_[_loc4_][0]);
            _loc3_.count = _loc2_[_loc4_][1];
            this.item = new ItemFace(_loc3_,65,65);
            this.item.x = 512;
            this.item.y = 262 + 89 * (_loc4_ - 1);
            this._container.addChild(this.item);
            _loc4_++;
         }
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

