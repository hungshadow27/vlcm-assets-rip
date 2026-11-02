package com.tgame.shell.view.components.woHuCangLong
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFormat;
   
   public class WoHuCangLong_PaiHangBangList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var paiming:FTextArea;
      
      private var mingzi:FTextArea;
      
      private var pingtai:FTextArea;
      
      private var touxian:FTextArea;
      
      private var weiwang:FTextArea;
      
      private var shenglv:FTextArea;
      
      public function WoHuCangLong_PaiHangBangList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 25;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.paiming = new FTextArea();
         addChild(this.paiming);
         this.paiming.multiline = true;
         this.paiming.defaultTextFormat = this.tf;
         this.paiming.wordWrap = true;
         this.paiming.width = 65;
         this.paiming.height = 200;
         this.paiming.x = -3;
         this.paiming.y = 4;
         this.paiming.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.paiming + " </font>";
         this.mingzi = new FTextArea();
         addChild(this.mingzi);
         this.mingzi.multiline = true;
         this.mingzi.defaultTextFormat = this.tf;
         this.mingzi.wordWrap = true;
         this.mingzi.width = 125;
         this.mingzi.height = 200;
         this.mingzi.x = 35 + 71 + 10 + 7 + 4 - 50 - 15 - 5;
         this.mingzi.y = 4;
         this.mingzi.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.name + " </font>";
         this.pingtai = new FTextArea();
         addChild(this.pingtai);
         this.pingtai.defaultTextFormat = this.tf;
         this.pingtai.wordWrap = true;
         this.pingtai.width = 150;
         this.pingtai.height = 25;
         this.pingtai.x = 155;
         this.pingtai.y = 4;
         this.pingtai.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + OtherConst.getPingTaiById(parseInt(data.pingtai)) + " </font>";
         this.touxian = new FTextArea();
         addChild(this.touxian);
         this.touxian.defaultTextFormat = this.tf;
         this.touxian.wordWrap = true;
         this.touxian.width = 150;
         this.touxian.height = 25;
         this.touxian.x = 245;
         this.touxian.y = 4;
         this.touxian.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.touxian + " </font>";
         this.weiwang = new FTextArea();
         addChild(this.weiwang);
         this.weiwang.defaultTextFormat = this.tf;
         this.weiwang.wordWrap = true;
         this.weiwang.width = 150;
         this.weiwang.height = 25;
         this.weiwang.x = 330;
         this.weiwang.y = 4;
         this.weiwang.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.weiwang + " </font>";
         this.shenglv = new FTextArea();
         addChild(this.shenglv);
         this.shenglv.defaultTextFormat = this.tf;
         this.shenglv.wordWrap = true;
         this.shenglv.width = 150 + 10 + 15 + 15;
         this.shenglv.height = 25;
         this.shenglv.x = 390;
         this.shenglv.y = 4;
         this.shenglv.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.shenglv + "%" + " </font>";
      }
   }
}

