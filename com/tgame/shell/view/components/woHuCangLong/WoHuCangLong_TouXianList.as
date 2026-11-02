package com.tgame.shell.view.components.woHuCangLong
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import flash.text.TextFormat;
   
   public class WoHuCangLong_TouXianList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var touxian:FTextArea;
      
      private var weiwang:FTextArea;
      
      private var jinpiao:FTextArea;
      
      public function WoHuCangLong_TouXianList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 22;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.touxian = new FTextArea();
         addChild(this.touxian);
         this.touxian.multiline = true;
         this.touxian.defaultTextFormat = this.tf;
         this.touxian.wordWrap = true;
         this.touxian.width = 65;
         this.touxian.height = 200;
         this.touxian.x = -3;
         this.touxian.y = 4;
         this.touxian.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.touxian + " </font>";
         this.weiwang = new FTextArea();
         addChild(this.weiwang);
         this.weiwang.multiline = true;
         this.weiwang.defaultTextFormat = this.tf;
         this.weiwang.wordWrap = true;
         this.weiwang.width = 125;
         this.weiwang.height = 200;
         this.weiwang.x = 52;
         this.weiwang.y = 4;
         this.weiwang.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.weiwang + " </font>";
         this.jinpiao = new FTextArea();
         addChild(this.jinpiao);
         this.jinpiao.defaultTextFormat = this.tf;
         this.jinpiao.wordWrap = true;
         this.jinpiao.width = 100;
         this.jinpiao.height = 25;
         this.jinpiao.x = 150;
         this.jinpiao.y = 4;
         var _loc1_:Goods = new Goods(int(data.jinpiao));
         this.jinpiao.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + _loc1_.res.name + " </font>";
      }
   }
}

