function data = allDFTs(data)
    for i = 1:8
        data{i} = DFT(data{i});
    end
end