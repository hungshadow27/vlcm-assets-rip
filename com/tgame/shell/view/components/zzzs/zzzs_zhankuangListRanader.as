package com.tgame.shell.view.components.zzzs
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFormat;
   
   public class zzzs_zhankuangListRanader extends FListCellRenderer
   {
      
      public function zzzs_zhankuangListRanader()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var lb:FTextArea;
         var zy:String;
         _height = 23;
         tf = new TextFormat();
         tf.align = "center";
         tf.color = StaticValue.WHITE;
         lb = new FTextArea();
         with(lb)
         {
            x = 0;
            y = 2;
            width = 120;
            height = 18;
            defaultTextFormat = tf;
            text = data.time;
         }
         addChild(lb);
         zy = LanResManager.getLanCommonTextWords("红方");
         if(data.type == 0)
         {
            zy = LanResManager.getLanCommonTextWords("红方");
         }
         else
         {
            zy = LanResManager.getLanCommonTextWords("蓝方");
         }
         lb = new FTextArea();
         with(lb)
         {
            x = 115 + 20 + 2;
            y = 2;
            width = 70;
            height = 18;
            defaultTextFormat = tf;
            text = zy;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 230;
            y = 2;
            width = 70;
            height = 18;
            defaultTextFormat = tf;
            text = data.killNum;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 330;
            y = 2;
            width = 110;
            height = 18;
            defaultTextFormat = tf;
            text = data.killHurt;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 495;
            y = 2;
            width = 86;
            height = 18;
            defaultTextFormat = tf;
            text = data.count;
         }
         addChild(lb);
      }
   }
}

