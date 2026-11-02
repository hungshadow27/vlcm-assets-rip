package com.tgame.shell.view.components
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class ShenDiaoXiaLvListPanel extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      private var tf:TextFormat;
      
      private var bit:Bitmap;
      
      private var xianlu:FTextArea;
      
      private var shenqingren:FTextArea;
      
      private var zhongbiao:FTextArea;
      
      private var shangjiao:FTextArea;
      
      private var shenqingBtn:SmallButton;
      
      private var shendiaohuodong:ShenDiaoXiaLvShenQingHuoDongPanel;
      
      public function ShenDiaoXiaLvListPanel()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 29;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.xianlu = new FTextArea();
         addChild(this.xianlu);
         this.xianlu.defaultTextFormat = this.tf;
         this.xianlu.width = 40;
         this.xianlu.height = 19;
         this.xianlu.x = 0;
         this.xianlu.y = 6;
         this.xianlu.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.xian + " </font>";
         this.shenqingren = new FTextArea();
         addChild(this.shenqingren);
         this.shenqingren.defaultTextFormat = this.tf;
         this.shenqingren.width = 240;
         this.shenqingren.height = 18;
         this.shenqingren.x = 42;
         this.shenqingren.y = 6;
         this.shenqingren.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.name + " </font>";
         this.zhongbiao = new FTextArea();
         addChild(this.zhongbiao);
         this.zhongbiao.defaultTextFormat = this.tf;
         this.zhongbiao.width = 80;
         this.zhongbiao.height = 19;
         this.zhongbiao.x = 35 + 204 + 10 + 15 + 19;
         this.zhongbiao.y = 6;
         this.zhongbiao.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.int1 + " </font>";
         this.shangjiao = new FTextArea();
         addChild(this.shangjiao);
         this.shangjiao.defaultTextFormat = this.tf;
         this.shangjiao.width = 83;
         this.shangjiao.height = 19;
         this.shangjiao.x = 35 + 303 + 20 + 10;
         this.shangjiao.y = 6;
         this.shangjiao.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.int2 + " </font>";
         this.shenqingBtn = new SmallButton();
         if(data.bo == 1)
         {
            this.shenqingBtn.label = LanResManager.getLanCommonTextWords("申请活动");
            this.shenqingBtn.enabled = true;
         }
         else if(data.bo == 2)
         {
            this.shenqingBtn.label = LanResManager.getLanCommonTextWords("申请结束");
            this.shenqingBtn.enabled = false;
         }
         else
         {
            this.shenqingBtn.label = LanResManager.getLanCommonTextWords("无法申请");
            this.shenqingBtn.enabled = false;
         }
         addChild(this.shenqingBtn);
         this.shenqingBtn.x = 35 + 417 + 4;
         this.shenqingBtn.y = 5;
         this.shenqingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         $parent.dispatchEvent(new BaseEvent(ShenDiaoXiaLv.UI_SHENDIAOXIALV_SHENQING_CLICK,"",[data.xian,data.int2]));
      }
   }
}

