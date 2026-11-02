package com.tgame.shell.view.components.shuanglongzhan
{
   import com.asQuery.$;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.shuanglongzhan20180709Skin;
   import game.utils.SkinTools;
   
   public class YN2017Shuanglongzhan2Panel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      private var arr3:Array = [];
      
      private var arr4:Array = [];
      
      private var arr5:Array = [];
      
      private var _container:Container;
      
      private var ft:FTextArea;
      
      private var currType:int;
      
      public function YN2017Shuanglongzhan2Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(shuanglongzhan20180709Skin.skin,"shuanglongzhan");
         this._container = new Container();
         addChild(this._container);
         this._container.x = -18;
         this._container.y = 153;
         this.ft = new FTextArea();
         this.ft.x = 355;
         this.ft.y = 298;
         this.ft.name = "wenben1";
         this.ft.textColor = StaticValue.WHITE;
         this.ft.height = 120;
         this.arr1 = [null,[729909,1],[730294,1],[729177,6],[730748,1],[713522,1]];
         this.arr2 = [null,[729909,1],[730294,1],[729177,6],[730748,1],[713522,1]];
         this.arr3 = [null,[729909,1],[730294,1],[729177,6],[730748,1],[713522,1]];
         this.arr4 = [null,[729909,1],[730294,1],[729177,6],[730748,1],[713522,1]];
         this.arr5 = [null,[729909,1],[730294,1],[729177,6],[730748,1],[713522,1]];
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
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
            case 74:
               _loc2_ = this.arr1;
               break;
            case 139:
               _loc2_ = this.arr2;
               break;
            case 153:
               _loc2_ = this.arr3;
               break;
            case 154:
               _loc2_ = this.arr4;
               break;
            case 158:
               _loc2_ = this.arr5;
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
            this.item.y = 262 + 76 * (_loc4_ - 1);
            this.item.x = 512;
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

