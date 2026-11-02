package com.tgame.moudels.banghui.controller
{
   import com.tgame.moudels.banghui.Banghui_ApplicationFacade;
   import com.tgame.moudels.banghui.model.Banghui_MsgReceivedProxy;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import com.tgame.moudels.banghui.view.Banghui_BanghuiCreatPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BanghuiInfoPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BanghuiListPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BanghuiMemberListPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BanghuiNewsPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BangqiAnchaPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BangqiBanggongPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BangqiInfoPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_GongchengGongchengchePanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_GongchengTimePanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_GongchengXiangyangguishuPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Banghui_StartupCommand extends SimpleCommand
   {
      
      public function Banghui_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Banghui_MsgReceivedProxy());
         facade.registerProxy(new Banghui_MsgSenderProxy());
         facade.registerCommand(Banghui_ApplicationFacade.BA_JIAN,Banghui_BajianCommand);
         facade.registerCommand(Banghui_ApplicationFacade.NPC_REQ_FUNCTION,Banghui_ToCanglongtanCommand);
         facade.registerMediator(new Banghui_BanghuiListPanelMediator());
         facade.registerMediator(new Banghui_BanghuiCreatPanelMediator());
         facade.registerMediator(new Banghui_BanghuiInfoPanelMediator());
         facade.registerMediator(new Banghui_BanghuiNewsPanelMediator());
         facade.registerMediator(new Banghui_BanghuiMemberListPanelMediator());
         facade.registerMediator(new Banghui_BangqiInfoPanelMediator());
         facade.registerMediator(new Banghui_BangqiAnchaPanelMediator());
         facade.registerMediator(new Banghui_BangqiBanggongPanelMediator());
         facade.registerMediator(new Banghui_GongchengTimePanelMediator());
         facade.registerMediator(new Banghui_GongchengXiangyangguishuPanelMediator());
         facade.registerMediator(new Banghui_GongchengGongchengchePanelMediator());
      }
   }
}

