package com.tgame.shell.view.components.jileizhi
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.JiLeiZhiPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class JiLeiZhiRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      private var ID:FTextArea;
      
      private var MingCheng:FTextArea;
      
      private var MiaoShu:FTextArea;
      
      private var Count:FTextArea;
      
      private var DuiHuanZhi:FTextArea;
      
      public function JiLeiZhiRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc1_:Bitmap = null;
         var _loc4_:String = null;
         _height = 100;
         _loc1_ = StaticValue.getBitmapByClassName("ui.mall.goods.slot");
         addChild(_loc1_);
         _loc1_.x = 14;
         _loc1_.y = 6 + 4;
         _loc1_ = StaticValue.getBitmapByClassName("ui.line");
         addChild(_loc1_);
         _loc1_.width = 596;
         _loc1_.y = 100;
         var _loc2_:DisplayObject = FLoader.startLoad(data.bigRes,65,65);
         addChild(_loc2_);
         _loc2_.x = 16;
         _loc2_.y = 8 + 4;
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(data.goodid,true);
         _loc4_ = _loc3_.res.name;
         this.MingCheng = new FTextArea();
         this.MingCheng.multiline = true;
         this.MingCheng.autoSize = TextFieldAutoSize.LEFT;
         this.MingCheng.wordWrap = true;
         this.MingCheng.width = 690;
         this.MingCheng.height = 200;
         this.MingCheng.x = 110;
         this.MingCheng.y = 20 - 7;
         this.MingCheng.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + _loc4_ + " </font>";
         this.Count = new FTextArea();
         this.Count.multiline = true;
         this.Count.autoSize = TextFieldAutoSize.LEFT;
         this.Count.wordWrap = true;
         this.Count.width = 690;
         this.Count.height = 200;
         this.Count.x = 110;
         this.Count.y = 40 - 2;
         this.Count.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.num + " </font>";
         this.DuiHuanZhi = new FTextArea();
         this.DuiHuanZhi.multiline = true;
         this.DuiHuanZhi.autoSize = TextFieldAutoSize.LEFT;
         this.DuiHuanZhi.wordWrap = true;
         this.DuiHuanZhi.width = 690;
         this.DuiHuanZhi.height = 200;
         this.DuiHuanZhi.x = 110;
         this.DuiHuanZhi.y = 60 - 2;
         this.DuiHuanZhi.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.price + " </font>";
         this.MiaoShu = new FTextArea();
         addChild(this.MiaoShu);
         this.MiaoShu.multiline = true;
         this.MiaoShu.autoSize = TextFieldAutoSize.LEFT;
         this.MiaoShu.wordWrap = true;
         this.MiaoShu.width = 690;
         this.MiaoShu.height = 200;
         this.MiaoShu.x = 200;
         this.MiaoShu.y = 20;
         this.MiaoShu.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.desc + " </font>";
         var _loc5_:SmallButton = new SmallButton();
         _loc5_.label = LanResManager.getLanCommonTextWords("购买");
         addChild(_loc5_);
         _loc5_.x = 538;
         _loc5_.y = 36;
         _loc5_.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         $parent.dispatchEvent(new BaseEvent(JiLeiZhiPanel.UI_JILEIZHI_DUIHUAN_CLICK,"",data.id));
      }
   }
}

