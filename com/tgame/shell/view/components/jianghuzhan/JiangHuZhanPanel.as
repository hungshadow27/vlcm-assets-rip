package com.tgame.shell.view.components.jianghuzhan
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
   import game.skin.JiangHuZhanSkin;
   import game.utils.SkinTools;
   
   public class JiangHuZhanPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      private var arr3:Array = [];
      
      private var arr4:Array = [];
      
      private var _container:Container;
      
      private var ft:FTextArea;
      
      private var currType:int;
      
      public function JiangHuZhanPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(JiangHuZhanSkin.skin,"zhoumorenaohuodong");
         this._container = new Container();
         addChild(this._container);
         this._container.x = 57;
         this._container.y = -34;
         this.ft = new FTextArea();
         this.ft.x = 355;
         this.ft.y = 298;
         this.ft.name = "wenben1";
         this.ft.textColor = StaticValue.WHITE;
         this.ft.height = 120;
         this.arr1 = [null,[713402,1],[713402,1],[713402,1],[713402,2],[713402,3],[713402,3],[713402,12],[713358,1]];
         this.arr2 = [null,[713402,1],[713402,1],[713402,1],[713402,2],[713402,3],[713402,3],[713402,12],[713358,1]];
         this.arr3 = [null,[713402,1],[713402,1],[713402,1],[713402,2],[713402,3],[713402,3],[713402,12],[713358,1]];
         this.arr4 = [null,[713402,1],[713402,1],[713402,1],[713402,2],[713402,3],[713402,3],[713402,12],[713358,1]];
         this.init();
      }
      
      private function init() : void
      {
         $("lingqu1 lingqu2 lingqu3 lingqu4 lingqu5 lingqu6 lingqu7 lingqu8",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben2",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.currType,uint(_loc2_[1])]);
      }
      
      public function setDataGoods(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Goods = null;
         this.currType = param1;
         switch(param1)
         {
            case 171:
               _loc2_ = this.arr1;
               break;
            case 172:
               _loc2_ = this.arr2;
               break;
            case 173:
               _loc2_ = this.arr3;
               break;
            case 174:
               _loc2_ = this.arr4;
               break;
            case 191:
               _loc2_ = this.arr4;
               break;
            case 179:
               _loc2_ = this.arr4;
               break;
            case 180:
               _loc2_ = this.arr4;
               break;
            case 181:
               _loc2_ = this.arr4;
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
            this.item = new ItemFace(_loc3_);
            this.item.y = 274 + 46 * (_loc4_ - 1);
            this.item.x = 384;
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

