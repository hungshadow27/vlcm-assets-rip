package com.tgame.shell.view.components.xiongwangdali
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.SimpleButton;
   import game.skin.XiongWangJieSkin;
   import game.utils.SkinTools;
   
   public class YN2017XiongwangdaliPanel extends BasePanel
   {
      
      private var guanbi:SimpleButton;
      
      private var lingqu1:SimpleButton;
      
      private var lingqu2:SimpleButton;
      
      private var lingqu3:SimpleButton;
      
      private var lingqu4:SimpleButton;
      
      private var lingqu5:SimpleButton;
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      public function YN2017XiongwangdaliPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(XiongWangJieSkin.skin,"xiongwangjiemian");
      }
      
      override protected function createVariableReference() : void
      {
         this._container = new Container();
         addChild(this._container);
         this._container.x = 61;
         this._container.y = 284;
         this.arr1 = [null,[711308,3],[723896,3],[724973,3],[711308,20],[728552,1]];
         this.guanbi = getChildByName("YBZLGBAN") as SimpleButton;
         this.lingqu1 = getChildByName("DFZQLQAN1") as SimpleButton;
         this.lingqu2 = getChildByName("DFZQLQAN2") as SimpleButton;
         this.lingqu3 = getChildByName("DFZQLQAN3") as SimpleButton;
         this.lingqu4 = getChildByName("DFZQLQAN4") as SimpleButton;
         this.lingqu5 = getChildByName("DFZQLQAN5") as SimpleButton;
         this.lingqu1.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.lingqu2.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.lingqu3.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.lingqu4.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.lingqu5.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.lingqu1.name = "1";
         this.lingqu2.name = "2";
         this.lingqu3.name = "3";
         this.lingqu4.name = "4";
         this.lingqu5.name = "5";
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
         this.setDataGoods(this.arr1);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[113,uint(param1.target.name)]);
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc3_:int = 1;
         while(_loc3_ < 6)
         {
            _loc2_ = new Goods(param1[_loc3_][0]);
            _loc2_.count = param1[_loc3_][1];
            this.item = new ItemFace(_loc2_,65,65);
            this.item.y = 110 + 76 * (_loc3_ - 1);
            this.item.x = 451;
            this._container.addChild(this.item);
            _loc3_++;
         }
      }
   }
}

