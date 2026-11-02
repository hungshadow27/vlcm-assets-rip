package com.tgame.shell.view.components.lliuyueqingzhu
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.systemculture.TipCanvas;
   import com.tgame.shell.view.components.utils.TipManager;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.LeiChongLiWu20231122Skin;
   import game.utils.SkinTools;
   
   public class LeiChongLiWuPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr:Array;
      
      private var _container:Container;
      
      public function LeiChongLiWuPanel()
      {
         var str:String;
         var tipCanvas:TipCanvas = null;
         this.arr = [];
         super();
         this.skin = SkinTools.getChildSkinByName(LeiChongLiWu20231122Skin.skin,"leichongliwu");
         str = "";
         tipCanvas = new TipCanvas(str,300);
         TipManager.regObj2HasTips($("huodongmiaoshu",this,true).getContainer(),null,false,function(param1:DisplayObject):TipCanvas
         {
            var _loc2_:String = "<textformat leading = \'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + "           【Thời gian Tích Lũy】" + "<br>" + "Hoạt động tích lũy từ 00:01 đến 23:59 mỗi ngày." + "<br>" + "           【Nội dung hoạt động】" + "<br>" + "Phúc lợi quà tặng khi quý nhân sĩ thanh toán nạp vàng trong ngày. " + "<br>" + "Tích lũy nạp càng nhiều, quà tặng càng giá trị. Hoạt động sẽ được làm mới khi bước qua ngày mới." + "<br>" + "Đừng quên nhận quà sau khi nạp nhé !" + "<br>" + "</font></textformat>";
            tipCanvas.htmlText = _loc2_;
            return tipCanvas;
         });
         this._container = new Container();
         addChild(this._container);
         this.arr = [[[712649,50],[713127,5],[713399,5],[713852,50]],[[712649,88],[713127,10],[713399,10],[43031,888],[42206,888]],[[712649,188],[713127,18],[713399,18],[43031,1888],[42206,1888],[713852,88],[727217,100]],[[712649,188],[713127,38],[713399,38],[43031,1888],[42206,1888],[713852,88],[736658,1],[727217,188],[43931,1888]],[[712649,288],[713127,68],[713399,68],[43031,2888],[42206,2888],[713852,188],[736658,1],[727217,188],[43931,1888],[733948,18]],[[712649,688],[713127,288],[713399,288],[43031,5888],[42206,4888],[713852,888],[736658,2],[727217,888],[43931,4888],[733948,68],[43130,3888],[732872,1]],[[712649,1688],[713127,688],[713399,688],[43031,8888],[42206,8888],[713852,888],[736658,2],[727217,1888],[43931,8888],[733948,168],[43130,8888],[732872,1],[735824,3]],[[712649,2688],[713127,488],[713399,488],[43031,18888],[42206,8888],[713852,1888],[736658,2],[727217,1888],[43931,18888],[733948,288],[43130,18888],[732872,2],[731506,9]],[[712649,5888],[713127,888],[713399,888],[43031,38888],[42206
         ,18888],[713852,3888],[736658,5],[727217,3888],[43931,38888],[733948,388],[43130,38888],[732872,3],[714998,1]]];
         this.init();
      }
      
      private function init() : void
      {
         $("lingqu1 lingqu2 lingqu3 lingqu4 lingqu5 lingqu6 lingqu7 lingqu8 lingqu9",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
         this.setDataGoods(this.arr);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben2",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("qu");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[300,uint(_loc2_[1])]);
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_];
            _loc5_ = 0;
            while(_loc5_ < param1[_loc3_].length)
            {
               _loc2_ = new Goods(_loc4_[_loc5_][0]);
               _loc2_.count = _loc4_[_loc5_][1];
               this.item = new ItemFace(_loc2_);
               this.item.x = 43 * _loc5_ + 28;
               this.item.y = 72 * _loc3_ + 120;
               this._container.addChild(this.item);
               _loc5_++;
            }
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

