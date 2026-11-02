package com.tgame.shell.view.components.lixia2018
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.RadioButtonGroup;
   import game.skin.GengXinZhenPinZhiMengJieMianSkin;
   import game.utils.SkinTools;
   
   public class ZhenPinZhiMengPanel extends BasePanel
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
      
      private var radioButtonGroup:RadioButtonGroup;
      
      private var baseT1:int = 292;
      
      private var baseT2:int = 303;
      
      private var basechongZhiT:int = 82;
      
      private var curT:int;
      
      private var indexDay:int = 0;
      
      public function ZhenPinZhiMengPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(GengXinZhenPinZhiMengJieMianSkin.skin,"gxzpzmjm");
         this._container = new Container();
         addChild(this._container);
         this._container.x = -78;
         this._container.y = 42;
         this.arr1 = [[713852,10],[735848,30],[743760,1],[735848,100],[715385,5],[743746,200],[743746,200],[743746,400]];
         this.arr2 = [[723896,9],[735848,50],[743767,1],[743746,100],[743625,20],[743746,200],[743746,200],[743746,400]];
         this.arr3 = [[727823,10],[743467,1],[743625,8],[715385,5],[743746,100],[743746,200],[743746,200],[743746,400]];
         this.arr4 = [[728633,1],[743625,5],[715385,3],[742026,3],[743746,100],[743746,200],[743746,200],[743746,400]];
         this.arr5 = [[728522,1],[715385,2],[743774,1],[743625,14],[743746,100],[743746,200],[743746,200],[743746,400]];
         this.arr6 = [[736779,1],[735848,50],[743781,1],[737342,1],[743625,20],[743746,200],[743746,200],[743746,400]];
         this.arr7 = [[736779,1],[743746,50],[715385,3],[743625,12],[743746,100],[743746,200],[743746,200],[743746,400]];
         this.arr8 = [null,[713852,10],[735681,2],[737588,1],[735848,5],[732707,1],[735848,30]];
         this.arr9 = [null,[713852,10],[733442,200],[737588,1],[735261,2],[732707,1],[735848,30]];
         this.arr10 = [null,[713852,10],[735146,5],[735848,5],[713852,888],[732707,1],[735848,30]];
         this.arr11 = [null,[713852,10],[733338,2],[731320,1],[735145,1],[732707,1],[735848,30]];
         this.arr12 = [null,[713852,10],[9715,10],[737588,1],[735848,5],[732707,1],[735848,30]];
         this.arr13 = [null,[713852,10],[726642,5],[737588,1],[735145,1],[732707,1],[735848,30]];
         this.arr14 = [null,[713852,10],[735848,5],[735261,2],[737181,2],[732707,1],[735848,30]];
         this.init();
      }
      
      override protected function createVariableReference() : void
      {
         this.radioButtonGroup = getChildByName("yeqian") as RadioButtonGroup;
         this.radioButtonGroup.addEventListener(MouseEvent.CLICK,this.onRadioCLick);
      }
      
      private function onRadioCLick(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = (param1.currentTarget as RadioButtonGroup).selectIndex;
         var _loc4_:int = 0;
         if(this.indexDay > 7)
         {
            _loc3_ = this.basechongZhiT + _loc2_ + 7;
            _loc4_ = _loc2_ + 7 + 1;
            this.curT = this.baseT2 + _loc2_ + 1;
         }
         else
         {
            _loc3_ = this.basechongZhiT + _loc2_;
            _loc4_ = _loc2_ + 1;
            this.curT = this.baseT1 + _loc2_ + 1;
         }
         var _loc5_:Array = this["arr" + _loc4_];
         this.setDataGoods(_loc5_);
         PipeManager.sendMsg(PipeConstants.SHOW_CHONGZHIDAY_PANEL,_loc3_);
      }
      
      private function init() : void
      {
         $("dxzpzmjmdh1 dxzpzmjmdh2 dxzpzmjmdh3 dxzpzmjmdh4 dxzpzmjmdh5 dxzpzmjmdh6 dxzpzmjmdh7 dxzpzmjmdh8",this,true).click(this.clickHanlder);
         $("guanbianniu",this,true).click(this.onClick);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("dh");
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
         while(_loc3_ < this.arr1.length)
         {
            _loc2_ = new Goods(param1[_loc3_][0]);
            _loc2_.count = param1[_loc3_][1];
            this.item = new ItemFace(_loc2_);
            this.item.x = 495;
            this.item.y = 223 + 41 * _loc3_;
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
            this.indexDay = 1;
         }
         else if(param1 == 294)
         {
            _loc2_ = this.arr2;
            this.indexDay = 2;
         }
         else if(param1 == 295)
         {
            _loc2_ = this.arr3;
            this.indexDay = 3;
         }
         else if(param1 == 296)
         {
            _loc2_ = this.arr4;
            this.indexDay = 4;
         }
         else if(param1 == 297)
         {
            _loc2_ = this.arr5;
            this.indexDay = 5;
         }
         else if(param1 == 298)
         {
            _loc2_ = this.arr6;
            this.indexDay = 6;
         }
         else if(param1 == 299)
         {
            _loc2_ = this.arr7;
            this.indexDay = 7;
         }
         else if(param1 == 304)
         {
            _loc2_ = this.arr8;
            this.indexDay = 8;
         }
         else if(param1 == 305)
         {
            _loc2_ = this.arr9;
            this.indexDay = 9;
         }
         else if(param1 == 306)
         {
            _loc2_ = this.arr10;
            this.indexDay = 10;
         }
         else if(param1 == 307)
         {
            _loc2_ = this.arr11;
            this.indexDay = 11;
         }
         else if(param1 == 308)
         {
            _loc2_ = this.arr12;
            this.indexDay = 12;
         }
         else if(param1 == 309)
         {
            _loc2_ = this.arr13;
            this.indexDay = 13;
         }
         else if(param1 == 310)
         {
            _loc2_ = this.arr14;
            this.indexDay = 14;
         }
         this.setDataGoods(_loc2_);
         var _loc3_:int = this.indexDay % 7;
         if(_loc3_ == 0)
         {
            _loc3_ = 7;
         }
         var _loc4_:int = _loc3_ - 1;
         if(this.indexDay > 7)
         {
            _loc4_ = this.basechongZhiT + _loc4_ + 7;
         }
         else
         {
            _loc4_ = this.basechongZhiT + _loc4_;
         }
         PipeManager.sendMsg(PipeConstants.SHOW_CHONGZHIDAY_PANEL,_loc4_);
         this.radioButtonGroup.selectIndex = _loc3_ - 1;
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

