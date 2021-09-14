clear all
uno = load('grupo1.mat');
byn=uno.ir(:,:);
h=[0,-1,0; -1,5,-1; 0, -1, 0];
[f,c]=size(byn);
k=3;
h1=[h(1,1:end), h(2,1:end), h(3,1:end)];
for i = length(h):f-length(h) + 1:
    for j = length(h):c-length(h) + 1:
        xr(k, :)=255*[byn(i, j:j+2), byn(i+1, j:j+2), byn(i+2, j:j+2)];
        yr(k, :)=conv(xr(k, :), h1);
        ir(i, j)=yr(k, 10);
        k=k+1;
    end
end

subplot(3, 1, 3)
imshow(ir/max(max(ir)))