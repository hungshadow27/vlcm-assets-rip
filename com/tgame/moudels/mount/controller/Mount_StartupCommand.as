package com.tgame.moudels.mount.controller
{
   import com.tgame.moudels.mount.Mount_ApplicationFacade;
   import com.tgame.moudels.mount.model.Mount_MsgReceivedProxy;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.moudels.mount.view.Mount_ChangeSuperMount;
   import com.tgame.moudels.mount.view.Mount_ChangeTowSuperMountMediator;
   import com.tgame.moudels.mount.view.Mount_DianFengPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_FengLeiShouPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_JiaohuanMoshouMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRideFeedPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRideMenghuandanMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRidePlaneMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRideQiannengdanPanelMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRideSkillResetPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_MainCharRideYinCangShuXingJihuoPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_MoShouHuHuanMediator;
   import com.tgame.moudels.mount.view.Mount_TargetCharRidePlaneMediator;
   import com.tgame.moudels.mount.view.Mount_XueShouTuiBianPlaneMediator;
   import com.tgame.moudels.mount.view.Mount_YueGuangBaoHePlaneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Mount_StartupCommand extends SimpleCommand
   {
      
      public function Mount_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Mount_MsgReceivedProxy());
         facade.registerProxy(new Mount_MsgSenderProxy());
         facade.registerMediator(new Mount_MainCharRidePlaneMediator());
         facade.registerMediator(new Mount_MainCharRideFeedPlaneMediator());
         facade.registerMediator(new Mount_MainCharRideSkillResetPlaneMediator());
         facade.registerMediator(new Mount_MainCharRideYinCangShuXingJihuoPlaneMediator());
         facade.registerMediator(new Mount_MainCharRideQiannengdanPanelMediator());
         facade.registerMediator(new Mount_MainCharRideMenghuandanMediator());
         facade.registerMediator(new Mount_TargetCharRidePlaneMediator());
         facade.registerMediator(new Mount_ChangeSuperMount());
         facade.registerMediator(new Mount_ChangeTowSuperMountMediator());
         facade.registerMediator(new Mount_JiaohuanMoshouMediator());
         facade.registerMediator(new Mount_MoShouHuHuanMediator());
         facade.registerMediator(new Mount_YueGuangBaoHePlaneMediator());
         facade.registerMediator(new Mount_XueShouTuiBianPlaneMediator());
         facade.registerMediator(new Mount_FengLeiShouPlaneMediator());
         facade.registerMediator(new Mount_DianFengPlaneMediator());
         facade.registerCommand(Mount_ApplicationFacade.UP_DOWN_HORSE,Mount_UpDownHorseCommand);
         facade.registerCommand(Mount_ApplicationFacade.CATCH_HORSE,Mount_CatchHorseCommand);
      }
   }
}

