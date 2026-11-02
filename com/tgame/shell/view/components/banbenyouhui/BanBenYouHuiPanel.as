package com.tgame.shell.view.components.banbenyouhui
{
   import com.asQuery.$;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.BanBenYouHui20180703Skin;
   import game.utils.SkinTools;
   
   public class BanBenYouHuiPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      private var _container:Container;
      
      private var ft:FTextArea;
      
      private var currType:int;
      
      public function BanBenYouHuiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(BanBenYouHui20180703Skin.skin,"banbenyouhui");
         this._container = new Container();
         addChild(this._container);
         this._container.x = 104;
         this._container.y = -88;
         this.ft = new FTextArea();
         this.ft.x = 355;
         this.ft.y = 298;
         this.ft.name = "wenben1";
         this.ft.textColor = StaticValue.WHITE;
         this.ft.height = 120;
         this.arr1 = [[711308,500],[728562,500],[727589,500],[42598,500],[728563,500],[728563,500],[728563,500]];
         this.arr2 = [[711308,500],[728562,500],[727589,500],[42598,500],[728563,500],[728563,500],[728563,500]];
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1",this,true).click(this.clickHanlder);
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
      
      public function setDataGoods(param1:int, param2:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:int = 0;
         this.currType = param1;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            _loc3_ = new Goods(7372);
            _loc3_.count = 500;
            this.item = new ItemFace(_loc3_,65,65);
            this.item.x = 46 + 90 * _loc4_;
            this.item.y = 372;
            this.item.mouseEnabled = false;
            this._container.addChild(this.item);
            if(param2[_loc4_] == 1)
            {
               this.item.filters = [];
            }
            else
            {
               this.item.filters = Tools.blackWhiteFilter;
            }
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

