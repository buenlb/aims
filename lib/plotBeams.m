imgpath = 'C:\Users\Taylor\Dropbox\Apps\Overleaf\Transducers\figs\';
%% 500 kHz
[data,y,x] = readAIMS('xz_longConeRough.snq',0,'C:\Users\Taylor\Box Sync\Taylor_AIMS\TxCharacterization\500kHzWithCone\');

y = y-y(1);

h = figure;
imagesc(y,x,-data);
colormap('hot')
axis('equal')
axis([y(1),y(end),x(1),x(end)]);
colorbar
xlabel('mm')
ylabel('mm')
makeFigureBig(h)
%%
print([imgpath,'500kHzLateralLongCone'],'-dpng')

[data,y,x] = readAIMS('xz_smallConeRough.snq',0,'C:\Users\Taylor\Box Sync\Taylor_AIMS\TxCharacterization\500kHzWithCone\');

y = y-y(1);

h = figure;
imagesc(y,x,-data);
colormap('hot')
axis('equal')
axis([y(1),12,x(1),x(end)]);
colorbar
xlabel('mm')
ylabel('mm')
makeFigureBig(h)

print([imgpath,'500kHzLateralShortCone'],'-dpng')

%% 1 MHz
[data,x,y] = readAIMS('xz_250res_longCone.snq',0,'C:\Users\Taylor\Box Sync\Taylor_AIMS\TxCharacterization\1MHzWithCone\');

y = y-y(1);

h = figure;
imagesc(y,x,-data');
colormap('hot')
axis('equal')
axis([y(1),y(end),x(1),x(end)]);
colorbar
xlabel('mm')
ylabel('mm')
makeFigureBig(h)

print([imgpath,'1MHzLateralLongCone'],'-dpng')

[data,x,y] = readAIMS('xz_250res_shortCone.snq',0,'C:\Users\Taylor\Box Sync\Taylor_AIMS\TxCharacterization\1MHzWithCone\');

y = y-y(1);

h = figure;
imagesc(y,x,-data');
colormap('hot')
axis('equal')
axis([y(1),12,x(1),x(end)]);
colorbar
xlabel('mm')
ylabel('mm')
makeFigureBig(h)

print([imgpath,'1MHzLateralShortCone'],'-dpng')

%% 5 MHz
[data,x,y] = readAIMS('xy_longConeTapedOn.snq',0,'C:\Users\Taylor\Box Sync\Taylor_AIMS\TxCharacterization\5MHzWithCone\');

h = figure;
imagesc(y,x,-data');
colormap('hot')
axis('equal')
axis([y(1),y(end),x(1),x(end)]);
colorbar
xlabel('mm')
ylabel('mm')
makeFigureBig(h)

print([imgpath,'5MHzAxialLongCone'],'-dpng')

[data,x,y] = readAIMS('xz_longConeTapedOn.snq',0,'C:\Users\Taylor\Box Sync\Taylor_AIMS\TxCharacterization\5MHzWithCone\');

h = figure;
imagesc(y,x,-data');
colormap('hot')
axis('equal')
axis([y(1),y(end),x(1),x(end)]);
colorbar
xlabel('mm')
ylabel('mm')
makeFigureBig(h)

print([imgpath,'5MHzLateralLongCone'],'-dpng')
