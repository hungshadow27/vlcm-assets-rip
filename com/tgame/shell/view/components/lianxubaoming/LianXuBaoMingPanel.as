package com.tgame.shell.view.components.lianxubaoming
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
   import game.skin.LianXuBaoMingHuoDongSkin;
   import game.utils.SkinTools;
   
   public class LianXuBaoMingPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      private var ft:FTextArea;
      
      public function LianXuBaoMingPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(LianXuBaoMingHuoDongSkin.skin,"lianxubaominghuodong");
         this._container = new Container();
         addChild(this._container);
         this._container.x = 51;
         this._container.y = 36;
         this.ft = new FTextArea();
         this.ft.x = 355;
         this.ft.y = 298;
         this.ft.name = "wenben1";
         this.ft.textColor = StaticValue.WHITE;
         this.ft.height = 120;
         this.arr1 = [[728693,400],[728693,400],[728693,400],[728693,400],[728693,400],[728693,400],[728693,400]];
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7 DFZQLQAN8",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
         this.setDataGoods(this.arr1);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[103,uint(_loc2_[1])]);
      }
      
      public function setDataGoods(param1:Array) : void
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
            this.item = new ItemFace(_loc2_,65,65);
            this.item.x = 46 + 90 * _loc3_;
            this.item.y = 372;
            this.item.mouseEnabled = false;
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

