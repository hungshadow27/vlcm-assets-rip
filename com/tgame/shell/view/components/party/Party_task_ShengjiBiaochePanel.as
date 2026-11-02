package com.tgame.shell.view.components.party
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.moudels.partyTask.model.info.BiaoCheInfo;
   import com.tgame.shell.view.components.Party_taskPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class Party_task_ShengjiBiaochePanel extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var biaocheSwf:MovieClip;
      
      private var loadUrl:String;
      
      private var biaocheUrl:String = "res/data/mc/biaoche/shengji/";
      
      public var bgImg:Bitmap;
      
      private var txtShow:FTextArea;
      
      private var txtName:FTextInput;
      
      private var lblSel:FLabel;
      
      private var SelBiaoList:FList;
      
      private var btnBiaoche:FSimpleButton;
      
      private var listContainer:FCanvas;
      
      private var txtShuxing:FTextArea;
      
      private var txtCailiao:FTextArea;
      
      private var btnName:SecondButton;
      
      private var btnUpdate:SecondButton;
      
      private var SwfID:int = 1;
      
      private var currName:String;
      
      public function Party_task_ShengjiBiaochePanel()
      {
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.party.task.shengjibiaoche.ui";
         addChild(this.bgImg);
         this.txtShow = new FTextArea();
         this.txtShow.autoSize = TextFieldAutoSize.LEFT;
         this.txtShow.x = 338;
         this.txtShow.y = 20;
         this.txtShow.width = 80;
         this.txtShow.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size=\'12\'>" + LanResManager.getLanCommonTextWords("镖车名称") + "：</font>";
         addChild(this.txtShow);
         this.btnName = new SecondButton();
         this.btnName.x = 540;
         this.btnName.y = 20;
         this.btnName.width = 80;
         this.btnName.height = 20;
         this.btnName.label = LanResManager.getLanCommonTextWords("确认修改");
         addChild(this.btnName);
         this.btnName.addEventListener(MouseEvent.CLICK,this.NameClick);
         this.txtShow = new FTextArea();
         this.txtShow.autoSize = TextFieldAutoSize.LEFT;
         this.txtShow.x = 338;
         this.txtShow.y = 48;
         this.txtShow.htmlText = "<font size=\'12\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("镖车等级") + "：</font>";
         addChild(this.txtShow);
         this.txtShow = new FTextArea();
         this.txtShow.autoSize = TextFieldAutoSize.LEFT;
         this.txtShow.x = 338;
         this.txtShow.y = 70;
         this.txtShow.htmlText = "<font size=\'12\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("镖车属性") + "：</font>";
         addChild(this.txtShow);
         this.txtShow = new FTextArea();
         this.txtShow.autoSize = TextFieldAutoSize.LEFT;
         this.txtShow.x = 338;
         this.txtShow.y = 155;
         this.txtShow.textColor = StaticValue.WHITE;
         this.txtShow.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size=\'12\'>" + LanResManager.getLanCommonTextWords("升级消耗") + "：</font>";
         addChild(this.txtShow);
         this.txtShow = new FTextArea();
         this.txtShow.autoSize = TextFieldAutoSize.LEFT;
         this.txtShow.x = 215;
         this.txtShow.y = 245;
         this.txtShow.htmlText = "<font size=\'12\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("镖车的等级越高,帮会成员参加运镖任务的奖励越高") + "</font>";
         addChild(this.txtShow);
         this.btnUpdate = new SecondButton();
         this.btnUpdate.x = 540;
         this.btnUpdate.y = 45 + 1;
         this.btnUpdate.label = LanResManager.getLanCommonTextWords("升级镖车");
         addChild(this.btnUpdate);
         this.btnUpdate.addEventListener(MouseEvent.CLICK,this.onClick);
         this.txtName = new FTextInput();
         this.txtName.autoSize = TextFieldAutoSize.LEFT;
         this.txtName.x = 410;
         this.txtName.y = 19;
         this.txtName.multiline = false;
         this.txtName.width = 180;
         this.txtName.setMaxChars(12);
         this.txtName.textColor = StaticValue.WHITE;
         this.txtName.text = LanResManager.getLanCommonTextWords("输入镖车名称");
         addChild(this.txtName);
         this.txtShuxing = new FTextArea();
         this.txtShuxing.autoSize = TextFieldAutoSize.LEFT;
         this.txtShuxing.wordWrap = true;
         this.txtShuxing.x = 360;
         this.txtShuxing.y = 105;
         this.txtShuxing.width = 250;
         this.txtShuxing.textColor = StaticValue.WHITE;
         this.txtShuxing.htmlText = "";
         addChild(this.txtShuxing);
         this.lblSel = new FLabel();
         this.lblSel.x = 412;
         this.lblSel.y = 47;
         this.lblSel.width = 160;
         this.lblSel.textColor = StaticValue.WHITE;
         this.lblSel.filters = StaticValue.filter;
         this.lblSel.htmlText = "";
         addChild(this.lblSel);
         this.txtCailiao = new FTextArea();
         this.txtCailiao.autoSize = TextFieldAutoSize.LEFT;
         this.txtCailiao.x = 360;
         this.txtCailiao.y = 181;
         this.txtCailiao.width = 250;
         this.txtCailiao.wordWrap = true;
         this.txtCailiao.textColor = StaticValue.WHITE;
         this.txtCailiao.htmlText = "";
         addChild(this.txtCailiao);
         this.btnBiaoche = new FSimpleButton();
         this.btnBiaoche.skin = "bottomButton";
         addChild(this.btnBiaoche);
         this.btnBiaoche.x = 512;
         this.btnBiaoche.y = 48;
         this.btnBiaoche.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         this.listContainer.x = 408;
         this.listContainer.y = 65;
         addChild(this.listContainer);
         this.listContainer.visible = false;
         this.SelBiaoList = new FList();
         this.SelBiaoList.skin = "list";
         this.SelBiaoList.listWidth = 105;
         this.SelBiaoList.x = 5;
         this.SelBiaoList.y = 2;
         this.SelBiaoList.itemRenderer = new BiaoCheGradeUPListRender();
         this.listContainer.addChild(this.SelBiaoList);
         this.SelBiaoList.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.listContainer.width = this.SelBiaoList.width + 10;
         this.listContainer.height = this.SelBiaoList.height + 4;
         this.currName = "";
      }
      
      private function NameClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnName:
               if(this.txtName.text == "")
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("镖车名称不能为空"));
                  return;
               }
               if(this.txtName.text.length < 2)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("镖车名称最短个字"));
                  return;
               }
         }
         if(this.SelBiaoList.selectItem == null)
         {
            return;
         }
         this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYTASK_BIAOCHENAME_CLICK,"",[this.SelBiaoList.selectItem.bcID,this.txtName.text]));
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         this.listContainer.visible = !this.listContainer.visible;
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function onClick(param1:MouseEvent) : void
      {
         if(this.SelBiaoList.selectItem == null)
         {
            return;
         }
         this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYTASK_SHENGJIBIAOCHE_CLICK,"",this.SelBiaoList.selectItem.bcID));
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         this.lblSel.text = this.SelBiaoList.selectItem.label;
         this.listContainer.visible = false;
         this.txtName.text = (this.SelBiaoList.selectItem as BiaoCheInfo).nickName;
         this.currName = this.SelBiaoList.selectItem.label;
         this.setSwf(this.SelBiaoList.selectItem.bcID);
         this.SetUpdateEnabled(this.SelBiaoList.selectItem.bcID);
         this.showEnergyQuality();
      }
      
      private function SetUpdateEnabled(param1:int) : void
      {
         if(param1 == 9)
         {
            this.btnUpdate.enabled = false;
         }
         else
         {
            this.btnUpdate.enabled = true;
         }
      }
      
      private function setSwf(param1:String) : void
      {
         var swfName:String = param1;
         if(this.loadUrl == GameConfig.fileBaseFolder + this.biaocheUrl + swfName + ".swf" && Boolean(this.biaocheSwf))
         {
            if(Boolean(this.biaocheSwf) && this.biaocheSwf.parent != null)
            {
               this.biaocheSwf.stop();
               this.biaocheSwf.parent.removeChild(this.biaocheSwf);
            }
            this.biaocheSwf.x = 25;
            this.biaocheSwf.y = 60;
            addChild(this.biaocheSwf);
            this.biaocheSwf.play();
            return;
         }
         this.loadUrl = GameConfig.fileBaseFolder + this.biaocheUrl + swfName + ".swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            if(Boolean(biaocheSwf) && biaocheSwf.parent != null)
            {
               biaocheSwf.stop();
               biaocheSwf.parent.removeChild(biaocheSwf);
            }
            biaocheSwf = _loc2_.content as MovieClip;
            if(biaocheSwf)
            {
               biaocheSwf.x = 25;
               biaocheSwf.y = 60;
               addChild(biaocheSwf);
            }
         },null,false,this.loadUrl);
      }
      
      public function setInit(param1:String, param2:String, param3:String, param4:String) : void
      {
         this.txtName.text = param1;
         this.txtShuxing.htmlText = param3;
         this.lblSel.htmlText = param2;
         this.txtCailiao.htmlText = param4;
      }
      
      public function showEnergyQuality() : void
      {
         var _loc1_:BiaoCheInfo = this.SelBiaoList.selectItem as BiaoCheInfo;
         if(_loc1_ != null)
         {
            this.txtShuxing.htmlText = LanResManager.getLanCommonTextWords("镖车的血量") + " " + _loc1_.bcHP + "  " + LanResManager.getLanCommonTextWords("镖车的移动速度") + " " + _loc1_.bcSpeed + "<br />" + LanResManager.getLanCommonTextWords("镖车的回血速度") + " " + _loc1_.bcHuiFu;
            this.txtCailiao.htmlText = _loc1_.getGradeUPCaiLao();
            this.setSwf(_loc1_.bcID.toString());
         }
      }
      
      public function removeSwf() : void
      {
         if(Boolean(this.biaocheSwf) && this.biaocheSwf.parent != null)
         {
            this.biaocheSwf.stop();
            this.biaocheSwf.parent.removeChild(this.biaocheSwf);
         }
      }
      
      public function setGradeUPData(param1:Array, param2:String) : void
      {
         this.removeSwf();
         this.SelBiaoList.dataProvider = param1;
         this.listContainer.height = 20 * param1.length + 5;
         if(this.currName == "")
         {
            this.currName = param2;
         }
         this.SelBiaoList.setSelectItemByLabel(this.currName);
         this.txtName.text = (this.SelBiaoList.selectItem as BiaoCheInfo).nickName;
         this.lblSel.text = this.SelBiaoList.selectItem.label;
         this.showEnergyQuality();
      }
   }
}

