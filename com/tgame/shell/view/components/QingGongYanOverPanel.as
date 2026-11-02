package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Buff;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.text.TextFieldAutoSize;
   
   public class QingGongYanOverPanel extends FPanel
   {
      
      public static const UI_QINGGONGYAN_OVER:String = "UI_QINGGONGYAN_OVER";
      
      private var shuoming:FTextArea;
      
      private var playerName:FTextArea;
      
      private var canjiarenshu:FTextArea;
      
      private var barbg:Bitmap;
      
      private var _itemface:ItemFace;
      
      private var _buffitem:Buff;
      
      private var fuwuqiICO:Bitmap;
      
      private var btIconPingtai:DisplayObject;
      
      public function QingGongYanOverPanel()
      {
         super();
         this.dragAble = true;
         this.skin = "sceondPanel_btn";
         this.showCloseButton = true;
         width = 380;
         height = 235;
         this.titleText = LanResManager.getLanCommonTextWords("庆功宴");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.barbg = new Bitmap();
         this.barbg.name = "bg";
         addChild(this.barbg);
         this.barbg.width = 368;
         this.barbg.height = 168;
         this.barbg.x = 6;
         this.barbg.y = 4;
         this.shuoming = new FTextArea();
         this.shuoming.x = 12;
         this.shuoming.y = 30;
         this.shuoming.width = 328;
         this.shuoming.filters = StaticValue.filter;
         this.shuoming.htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("庆功宴规则") + "<br></font></textformat>";
         addChild(this.shuoming);
         this.fuwuqiICO = new Bitmap();
         addChild(this.fuwuqiICO);
         this.fuwuqiICO.x = 65;
         this.fuwuqiICO.y = 130;
         this.playerName = new FTextArea();
         this.playerName.x = 91 + 30;
         this.playerName.y = 137;
         this.playerName.filters = StaticValue.filter;
         this.playerName.autoSize = TextFieldAutoSize.LEFT;
         this.playerName.htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + "" + "</font></textformat>";
         addChild(this.playerName);
         this.canjiarenshu = new FTextArea();
         this.canjiarenshu.x = 10;
         this.canjiarenshu.y = 183;
         this.canjiarenshu.autoSize = TextFieldAutoSize.LEFT;
         this.canjiarenshu.filters = StaticValue.filter;
         this.canjiarenshu.htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + "" + "</font></textformat>";
         addChild(this.canjiarenshu);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setPlayerName(param1:String) : void
      {
         this.playerName.htmlText = "<textformat><font size=\'14\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font></textformat>";
      }
      
      public function setPlayerNumber(param1:int) : void
      {
         var _loc2_:String = param1 == -1 ? LanResManager.getLanCommonTextWords("正在统计中") : param1.toString() + LanResManager.getLanCommonTextWords("人");
         this.canjiarenshu.htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("参加庆功宴的玩家") + ":" + _loc2_ + "</font></textformat>";
      }
      
      public function setBuff(param1:Buff) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this._itemface != null && contains(this._itemface))
         {
            removeChild(this._itemface);
         }
         this._buffitem = param1;
         this._itemface = new ItemFace(this._buffitem);
         this._itemface.mouseEnabled = false;
         this._itemface.mouseChildren = false;
         this._itemface.x = 320;
         this._itemface.y = 128;
         addChild(this._itemface);
      }
      
      public function setPanel(param1:int) : void
      {
         var _loc2_:BitmapData = null;
         if(param1 != -1)
         {
            if(this.barbg != null)
            {
               removeChild(this.barbg);
            }
            this.barbg = StaticValue.getBitmapByClassName("ui.qinggongyan.kuapingtai.bg.ui");
            addChildAt(this.barbg,0);
            this.barbg.width = 368;
            this.barbg.height = 168;
            this.barbg.x = 6;
            this.barbg.y = 4;
            this.shuoming.htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("跨平台比武大会庆功宴描述") + "<br></font></textformat>";
            _loc2_ = RslLoaderManager.getInstance("ui.pingtai.id." + (param1 - 1),30,30);
            this.fuwuqiICO.bitmapData = _loc2_;
            this.btIconPingtai = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/biwudahuiKPT/" + param1 + "_small.png",30,30);
            if(this.btIconPingtai)
            {
               this.btIconPingtai.x = 65 + 30;
               this.btIconPingtai.y = 130;
               addChild(this.btIconPingtai);
            }
            this.playerName.x = 71 + 25 + 30;
            this.playerName.y = 138;
         }
         else
         {
            this.fuwuqiICO.bitmapData = null;
            if(this.barbg != null)
            {
               removeChild(this.barbg);
            }
            this.barbg = StaticValue.getBitmapByClassName("ui.qinggongyan.bg.ui");
            addChildAt(this.barbg,0);
            this.barbg.width = 368;
            this.barbg.height = 168;
            this.barbg.x = 6;
            this.barbg.y = 4;
            this.shuoming.htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("庆功宴规则") + "<br></font></textformat>";
            this.playerName.x = 71 + 20;
            this.playerName.y = 138;
         }
      }
   }
}

