package com.tgame.shell.view.components.tunshitiandi
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFormat;
   
   public class TunShiTianDi_PaiHangBangList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var paiming:FTextArea;
      
      private var mingzi:FTextArea;
      
      private var xunzhangItem:ItemFace;
      
      private var dZmingzi:FTextArea;
      
      private var pingtai:FTextArea;
      
      private var jifen:FTextArea;
      
      private var shenglv:FTextArea;
      
      public function TunShiTianDi_PaiHangBangList()
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
         this.paiming.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.paiMing + " </font>";
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
         this.dZmingzi = new FTextArea();
         addChild(this.dZmingzi);
         this.dZmingzi.multiline = true;
         this.dZmingzi.defaultTextFormat = this.tf;
         this.dZmingzi.wordWrap = true;
         this.dZmingzi.width = 125;
         this.dZmingzi.height = 200;
         this.dZmingzi.x = 35 + 71 + 10 + 7 + 4 - 50 - 15 - 5 + 134 - 20;
         this.dZmingzi.y = 4;
         this.dZmingzi.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.diZhiName + " </font>";
         this.pingtai = new FTextArea();
         addChild(this.pingtai);
         this.pingtai.defaultTextFormat = this.tf;
         this.pingtai.wordWrap = true;
         this.pingtai.width = 150;
         this.pingtai.height = 25;
         this.pingtai.x = 155 + 110 - 30 + 15;
         this.pingtai.y = 4;
         this.pingtai.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + OtherConst.getPingTaiById(parseInt(data.pingTai)) + " </font>";
         this.jifen = new FTextArea();
         addChild(this.jifen);
         this.jifen.defaultTextFormat = this.tf;
         this.jifen.wordWrap = true;
         this.jifen.width = 150;
         this.jifen.height = 25;
         this.jifen.x = 245 + 100 - 10;
         this.jifen.y = 4;
         this.jifen.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.jiFen + " </font>";
         this.shenglv = new FTextArea();
         addChild(this.shenglv);
         this.shenglv.defaultTextFormat = this.tf;
         this.shenglv.wordWrap = true;
         this.shenglv.width = 150 + 10 + 15 + 15;
         this.shenglv.height = 25;
         this.shenglv.x = 390 + 10;
         this.shenglv.y = 4;
         this.shenglv.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.shengLv + "%" + " </font>";
      }
   }
}

