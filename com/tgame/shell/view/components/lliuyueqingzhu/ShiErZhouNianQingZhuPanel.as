package com.tgame.shell.view.components.lliuyueqingzhu
{
   import com.asQuery.$;
   import com.fireice.util.Tools;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.RadioButton;
   import game.display.RadioButtonGroup;
   import game.display.ScrollBar;
   import game.skin.shierzhounianqingsuoxiao20231130Skin;
   import game.utils.SkinTools;
   
   public class ShiErZhouNianQingZhuPanel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var page4:ShiErZhouNianContent3;
      
      private var content:DisplayObject;
      
      private var scrollBar:ScrollBar;
      
      private var rg:RadioButtonGroup;
      
      private var r1:RadioButton;
      
      private var r2:RadioButton;
      
      private var r3:RadioButton;
      
      private var r4:RadioButton;
      
      public function ShiErZhouNianQingZhuPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(shierzhounianqingsuoxiao20231130Skin.skin,"shierzhounianqing");
         this._container = new Container();
         addChild(this._container);
         this._container.x = 18;
         this._container.y = 160;
         this.arr1 = [[732693,1],[731508,1],[729667,1],[728891,1],[734652,1],[727217,1],[736562,1]];
         this.setDataGoods(this.arr1);
         this.page4 = new ShiErZhouNianContent3();
         addChild(this.page4);
         this.setPage(4);
         this.init();
      }
      
      private function init() : void
      {
         $("znqgb",this,true).click(this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      override protected function createVariableReference() : void
      {
         this.rg = getChildByName("fanyeanniuzu") as RadioButtonGroup;
         this.r1 = this.rg.getChildByName("fanyeanniuzu1") as RadioButton;
         this.r2 = this.rg.getChildByName("fanyeanniuzu2") as RadioButton;
         this.r3 = this.rg.getChildByName("fanyeanniuzu3") as RadioButton;
         this.r4 = this.rg.getChildByName("fanyeanniuzu4") as RadioButton;
         this.rg.selectIndex = 0;
         this.r1.filters = this.r2.filters = this.r3.filters = Tools.blackWhiteFilter;
         this.rg.addEventListener(MouseEvent.CLICK,this.onClicHandler);
         this.scrollBar = getChildByName("huatiao") as ScrollBar;
      }
      
      private function onClicHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = (param1.currentTarget as RadioButtonGroup).selectIndex;
         var _loc3_:int = Math.abs(_loc2_ - 3);
         this.setPage(_loc3_ + 1);
      }
      
      private function setPage(param1:int) : void
      {
         if(param1 < 4)
         {
            return;
         }
         if(this.content)
         {
            this.content.visible = false;
            this.content = null;
         }
         switch(param1)
         {
            case 4:
               this.content = this.page4 as DisplayObject;
         }
         this.content.visible = true;
         this.scrollBar.target = this.content;
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.arr1.length)
         {
            _loc2_ = new Goods(param1[_loc3_][0]);
            this.item = new ItemFace(_loc2_,65,65);
            this.item.setShowCount(false);
            this.item.x = 319 + 126 * _loc3_;
            this.item.y = 228;
            this._container.addChild(this.item);
            _loc3_++;
         }
      }
   }
}

import com.asQuery.$;
import com.fireice.util.Tools;
import com.greensock.TweenLite;
import com.tgame.PipeConstants;
import com.tgame.common.ui.componets.BasePanel;
import com.tgame.manager.PipeManager;
import flash.display.Shape;
import flash.events.MouseEvent;
import game.display.Container;
import game.skin.shierzhounianqingsuoxiao20231130Skin;
import game.utils.SkinTools;

class ShiErZhouNianContent extends BasePanel
{
   
   public function ShiErZhouNianContent()
   {
      super();
      this.skin = SkinTools.getChildSkinByName(shierzhounianqingsuoxiao20231130Skin.skin,"jiangli4");
      $("dhan1 dhan2 dhan3 dhan4 dhan5 dhan6 dhan7 dhan8 dhan9 dhan10 dhan11",this,true).click(this.clickHanlder);
   }
   
   private function clickHanlder(param1:MouseEvent) : void
   {
      var _loc2_:Array = String(param1.target.name).split("an");
      PipeManager.sendMsg(PipeConstants.SEND_53099,[323,uint(_loc2_[1])]);
   }
}

class ShiErZhouNianContent2 extends BasePanel
{
   
   public function ShiErZhouNianContent2()
   {
      super();
      this.skin = SkinTools.getChildSkinByName(shierzhounianqingsuoxiao20231130Skin.skin,"jiangli2");
      $("dhan6 dhan7 dhan8 dhan9 dhan10 dhan11 dhan12 dhan13 dhan14 dhan15 dhan16 dhan17",this,true).click(this.clickHanlder);
   }
   
   private function clickHanlder(param1:MouseEvent) : void
   {
      var _loc2_:Array = String(param1.target.name).split("an");
      PipeManager.sendMsg(PipeConstants.SEND_53099,[321,uint(_loc2_[1]) - 5]);
   }
}

class ShiErZhouNianContent3 extends BasePanel
{
   
   private var con:Container;
   
   private var page:int;
   
   public function ShiErZhouNianContent3()
   {
      super();
      this.skin = SkinTools.getChildSkinByName(shierzhounianqingsuoxiao20231130Skin.skin,"jiangli4");
      var _loc1_:Shape = new Shape();
      _loc1_.graphics.beginFill(16776960);
      _loc1_.graphics.drawRect(282,722,488,140);
      _loc1_.graphics.endFill();
      addChild(_loc1_);
      this.con = getChildByName("group") as Container;
      this.con.mask = _loc1_;
      this.page = 0;
      $("srznqzfanyezuo1 srznqzfanyeyou1",this,true).click(this.onClickFanHadnler);
      $("srznqzfanyezuo1",this,true).attr("filters",Tools.blackWhiteFilter);
      $("dhan12 dhan13 dhan14 dhan15 dhan16 dhan17 dhan18",this.con,true).click(this.clickHanlder);
      $("dhan1 dhan2 dhan3 dhan4 dhan5 dhan6 dhan7 dhan8 dhan9 dhan10 dhan11",this,true).click(this.clickHanlder);
   }
   
   private function onClickFanHadnler(param1:MouseEvent) : void
   {
      switch(param1.target.name)
      {
         case "srznqzfanyezuo1":
            if(this.page <= 0)
            {
               return;
            }
            --this.page;
            TweenLite.to(this.con,0.5,{"x":282 - this.page * 488});
            break;
         case "srznqzfanyeyou1":
            if(this.page >= 1)
            {
               return;
            }
            ++this.page;
            TweenLite.to(this.con,0.5,{"x":282 - this.page * 488});
      }
      $("srznqzfanyezuo1",this,true).attr("filters",this.page <= 0 ? Tools.blackWhiteFilter : []);
      $("srznqzfanyeyou1",this,true).attr("filters",this.page >= 2 ? Tools.blackWhiteFilter : []);
   }
   
   private function clickHanlder(param1:MouseEvent) : void
   {
      var _loc2_:Array = String(param1.target.name).split("han");
      PipeManager.sendMsg(PipeConstants.SEND_53099,[323,uint(_loc2_[1])]);
   }
}
