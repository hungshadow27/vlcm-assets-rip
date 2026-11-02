package com.tgame.shell.view.components.lliuyueqingzhu
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.LiDongJieSkin;
   import game.utils.SkinTools;
   
   public class LiDongJie2023Panel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      public function LiDongJie2023Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(LiDongJieSkin.skin,"lidongjie");
         this._container = new Container();
         addChild(this._container);
         this.init();
      }
      
      private function init() : void
      {
         $("lidongannv1 lidongannv2 lidongannv3 lidongannv4 lidongannv5 lidongannv6 lidongannv7 lidongannv8 lidongannv9 lidongannv10 lidongannv11",this,true).click(this.clickHanlder);
         $("lidongleijiguanbi",this,true).click(this.onClick);
      }
      
      public function setNum(param1:Array) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Object;
            if(_loc2_ == 1)
            {
               $("wenben1" + (_loc2_ + 11),this,true).attr("text",Math.floor(_loc3_.curPro / 60) + "/" + _loc3_.maxPro);
            }
            else
            {
               $("wenben1" + (_loc2_ + 11),this,true).attr("text",_loc3_.curPro + "/" + _loc3_.maxPro);
            }
            _loc2_++;
         }
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("nv");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[324,uint(_loc2_[1])]);
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
            this.item = new ItemFace(_loc2_);
            this.item.x = 575;
            this.item.y = 266 + 59 * (_loc3_ - 1);
            this._container.addChild(this.item);
            _loc3_++;
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

